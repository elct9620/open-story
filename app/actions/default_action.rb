# frozen_string_literal: true

# :nodoc:
class DefaultAction < OpenStory::Action
  DEFAULT_RESPONSES = [
    '你似乎跟這個世界產生了聯繫，然而這裡是完全「虛無」的狀態',
    '「虛無」是指連「黑暗」的概念都不存在，什麼都做不了⋯⋯',
    '「⋯⋯⋯⋯⋯⋯」'
  ].freeze

  def call(*)
    DEFAULT_RESPONSES.sample
  end
end
