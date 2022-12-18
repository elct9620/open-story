ARG APP_ROOT=/src/app
ARG RUBY_VERSION=3.1.3

FROM ruby:${RUBY_VERSION}-alpine AS gem
ARG APP_ROOT

RUN apk add --no-cache build-base

RUN mkdir -p ${APP_ROOT}
COPY Gemfile Gemfile.lock ${APP_ROOT}/

WORKDIR ${APP_ROOT}
RUN gem install bundler:2.3.14 \
    && bundle config --local deployment 'true' \
    && bundle config --local frozen 'true' \
    && bundle config --local no-cache 'true' \
    && bundle config --local without 'development test' \
    && bundle install -j "$(getconf _NPROCESSORS_ONLN)" \
    && find ${APP_ROOT}/vendor/bundle -type f -name '*.c' -delete \
    && find ${APP_ROOT}/vendor/bundle -type f -name '*.h' -delete \
    && find ${APP_ROOT}/vendor/bundle -type f -name '*.o' -delete \
    && find ${APP_ROOT}/vendor/bundle -type f -name '*.gem' -delete

FROM ruby:${RUBY_VERSION}-alpine
ARG APP_ROOT

COPY --from=gem /usr/local/bundle/config /usr/local/bundle/config
COPY --from=gem /usr/local/bundle /usr/local/bundle
COPY --from=gem ${APP_ROOT}/vendor/bundle ${APP_ROOT}/vendor/bundle

RUN mkdir -p ${APP_ROOT}

ENV APP_ROOT=$APP_ROOT

COPY . ${APP_ROOT}

# Apply Execute Permission
RUN adduser -h ${APP_ROOT} -D -s /bin/nologin ruby ruby && \
    chown ruby:ruby ${APP_ROOT} && \
    chmod -R +r ${APP_ROOT}

ENV OPENSTORY_ENV=production

USER ruby
WORKDIR ${APP_ROOT}

ENTRYPOINT ["bin/openstory"]
CMD ["server"]
