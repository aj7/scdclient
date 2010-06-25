require 'test_helper'

class ConceptCommonLinkTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ConceptCommonLink.new.valid?
  end
end
