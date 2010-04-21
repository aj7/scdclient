require 'test_helper'

class NameRelationshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert NameRelationship.new.valid?
  end
end
