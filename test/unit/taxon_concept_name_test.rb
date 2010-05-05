require 'test_helper'

class TaxonConceptNameTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TaxonConceptName.new.valid?
  end
end
