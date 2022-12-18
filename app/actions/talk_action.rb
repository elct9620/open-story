# frozen_string_literal: true

# :nodoc:
class TalkAction < OpenStory::Action
  DEFAULT_RESPONSE = '你試著發出聲音，然而這裡似乎不存在這樣的概念'

  def call(*)
    DEFAULT_RESPONSE
  end
end
