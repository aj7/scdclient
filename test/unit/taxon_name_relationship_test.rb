require 'test_helper'

class TaxonNameRelationshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TaxonNameRelationship.new.valid?
  end
end
