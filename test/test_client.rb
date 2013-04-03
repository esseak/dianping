require 'test/unit'
require 'dianping'

class ClientTest < Test::Unit::TestCase
  def test_hi
    assert_equal "hello there", DianPing::Client.new.hi
  end
end
