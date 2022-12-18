# frozen_string_literal: true

When('發送 {string}') do |message|
  route = OpenStory.application.router.match(message)
  next unless route

  @response = route.resolve.call
end

Then('我會看到以下其中一句話') do |expected|
  content = expected.hashes.map { |row| row['內容'] }
  expect(content).to include(@response)
end
