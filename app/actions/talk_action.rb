# frozen_string_literal: true

# :nodoc:
class TalkAction < OpenStory::Action
  DEFAULT_RESPONSES = [
    '試著發出聲音，然而這裡似乎不存在這樣的概念',
    '意識真的存在嗎？在另一側似乎完全不受影響',
    '開始懷疑這個模糊的感覺是什麼，沒有任何反應'
  ].freeze

  def handle(*)
    DEFAULT_RESPONSES.sample
  end
end
