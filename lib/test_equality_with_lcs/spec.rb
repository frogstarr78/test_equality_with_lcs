module TestEqualityWithLCS
  module Spec

    class BeEqualWithLCS
      include SharedMethods
      def initialize expected
        @expected = expected
      end

      def matches? target
        @target = target
        @expected == @target
      end

      def failure_message_for_should
        message_for_argument_types @expected, @target
      end

      def failure_message_for_should_not
        message_for_argument_types @expected, @target
      end
    end

    def be_equal_with_lcs expected
      BeEqualWithLCS.new expected
    end
  end
end
