module TestEqualityWithLCS
  module SharedMethods
    @@colorize = true
    def self.included in_class
      in_class.class.send :define_method, :colorize do
        @@colorize
      end

      in_class.class.send :define_method, :colorize= do |color|
        @@colorize = color
      end
    end

    private
      def message_for_argument_types string1, string2
        if string1.is_a? String and string2.is_a? String
          delegating_to_string_generating_method string1, string2
        elsif string1.is_a? Array and string2.is_a? Array
          lcs_message(string1, string2)
        else
          raise Test::Unit::AssertionFailedError.new("Comparing different types.")
        end
      end

    def delegating_to_string_generating_method string1, string2
      seq1 = string1.split "\n"
      seq2 = string2.split "\n"
      messages = []
      (['']*seq1.size).zip(seq1, seq2).each do |junk, line1, line2|
        messages << lcs_message("#{line1}", "#{line2}")
      end
      messages.join "\n"
    end

    def lcs_message string1, string2
      message_array = []
      Diff::LCS.sdiff string1, string2 do |diff| 
        action = diff.action == '=' ? ' ' : diff.action
        case action
        when '-'
          color  = :red
        when '+'
          color  = :green
        when '!'
          color = :magenta
        else
          color  = :white
        end
        left   = diff.new_element || ' '
        right  = diff.old_element || ' '
        message_array << [action, left, right].map {|thing| thing.send(@@colorize ? color : :to_s) }
      end
      horizontal_diff_array = message_array.transpose
      horizontal_messages = horizontal_diff_array.map {|diff| diff.join '' }
      horizontal_messages.join "\n"
    end
  end
end
