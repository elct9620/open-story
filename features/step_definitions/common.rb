# frozen_string_literal: true

When('發送 {string}') do |message|
  route, matched = OpenStory.application.router.match(message)
  next unless route

  env = {
    params: matched&.named_captures || {},
    source: :cucumber,
    user_id: 1,
    id: 1
  }

  @response = route.resolve.call(env)
end

Then('我會看到以下其中一句話') do |expected|
  content = expected.hashes.map { |row| row['內容'] }
  expect(content).to include(@response)
end
