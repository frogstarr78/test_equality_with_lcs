$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'test_equality_with_lcs'
require 'test_equality_with_lcs/spec'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  config.include TestEqualityWithLCS::Spec  
end
