# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `multi_test` gem.
# Please instead update this file by running `bin/tapioca gem multi_test`.

module MultiTest
  class << self
    # source://multi_test//lib/multi_test.rb#3
    def disable_autorun; end

    # source://multi_test//lib/multi_test.rb#30
    def extend_with_best_assertion_library(object); end
  end
end

class MultiTest::AssertionLibrary
  # @return [AssertionLibrary] a new instance of AssertionLibrary
  #
  # source://multi_test//lib/multi_test/assertion_library.rb#9
  def initialize(requirer, extender); end

  # source://multi_test//lib/multi_test/assertion_library.rb#23
  def extend_world(world); end

  # @return [Boolean]
  #
  # source://multi_test//lib/multi_test/assertion_library.rb#14
  def require?; end

  class << self
    # source://multi_test//lib/multi_test/assertion_library.rb#36
    def available; end

    # source://multi_test//lib/multi_test/assertion_library.rb#5
    def detect_best; end

    # source://multi_test//lib/multi_test/assertion_library.rb#29
    def null; end
  end
end

module MultiTest::MinitestWorld
  # Returns the value of attribute assertions.
  #
  # source://multi_test//lib/multi_test/minitest_world.rb#8
  def assertions; end

  # Sets the attribute assertions
  #
  # @param value the value to set the attribute assertions to.
  #
  # source://multi_test//lib/multi_test/minitest_world.rb#8
  def assertions=(_arg0); end

  class << self
    # @private
    #
    # source://multi_test//lib/multi_test/minitest_world.rb#3
    def extended(base); end
  end
end
