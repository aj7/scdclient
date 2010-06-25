require 'test_helper'

class CommonNameTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CommonName.new.valid?
  end
end
