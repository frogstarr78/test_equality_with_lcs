$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'test_equality_with_lcs'
require 'test_equality_with_lcs/unit'
require 'test/unit'

class Test::Unit::TestCase
  include TestEqualityWithLCS::Unit
end
