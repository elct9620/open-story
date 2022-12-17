# frozen_string_literal: true

# :nodoc:
class PlurkObserver < ApplicationObserver
  KEYWORD = '#OpenStory'
  DEFAULT_RESPONSE = '世界受到了一些干涉，然而連意識的概念都不存在，什麼變化都沒有⋯⋯'

  def api
    ClosedWorld[:plurk]
  end

  def channel
    @channel ||= api.create_channel
  end

  def me
    @me ||= api.me
  end

  def start
    OpenStory::Plurk::Realtime.new(channel).each do |plurk|
      next if plurk.user_id == me.id

      case plurk
      in OpenStory::Plurk::Plurk then on_plurk(plurk)
      in OpenStory::Plurk::Response then on_response(plurk)
      end
    end
  end

  def on_plurk(plurk)
    return unless plurk.content.include?(KEYWORD)

    reply_to(plurk.id, DEFAULT_RESPONSE)
  end

  def on_response(response)
    return if response.plurk.nil?
    return unless response.plurk.content.include?(KEYWORD)

    reply_to(response.plurk_id, DEFAULT_RESPONSE)
  end

  def reply_to(id, content)
    api.add_response OpenStory::Plurk::Response.new(
      plurk_id: id,
      content:
    )
  end
end
