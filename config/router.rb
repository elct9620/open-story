# frozen_string_literal: true

OpenStory.application.router.draw do
  action(/「.*」/, to: 'talk')
  default to: 'default'
end
