require 'test_helper'

class TaxonConceptTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TaxonConcept.new.valid?
  end
end
