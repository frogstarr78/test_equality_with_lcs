require 'test/unit/assertions'

module TestEqualityWithLCS
  module Unit
    include SharedMethods
    def assert_equal_with_lcs string1, string2
      # depending on the size of the strings
      # and since we generate the error message
      # before running the assertion
      # we want to bypass this behavior for the sake of speed
      return if string1 == string2

      message = message_for_argument_types string1, string2
      assert_block message do
        string1 == string2
      end
    end
  end
end
