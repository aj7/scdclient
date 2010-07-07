require 'test_helper'

class TaxonNameTest < ActiveSupport::TestCase
  def setup
    @taxonname =  TaxonName.make
  end

  def test_should_be_true
    assert true
  end

  should "be true" do
    assert true
  end

end
