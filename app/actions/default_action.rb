# frozen_string_literal: true

# :nodoc:
class DefaultAction < OpenStory::Action
  DEFAULT_RESPONSE = '世界受到了一些干涉，然而連意識的概念都不存在，什麼變化都沒有⋯⋯'

  def call(*)
    DEFAULT_RESPONSE
  end
end
