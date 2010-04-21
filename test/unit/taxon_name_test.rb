require 'test_helper'

class TaxonNameTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TaxonName.new.valid?
  end
end
