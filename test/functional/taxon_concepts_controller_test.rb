require 'test_helper'

class TaxonConceptsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TaxonConcept.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TaxonConcept.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TaxonConcept.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to taxon_concept_url(assigns(:taxon_concept))
  end
  
  def test_edit
    get :edit, :id => TaxonConcept.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TaxonConcept.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TaxonConcept.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TaxonConcept.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TaxonConcept.first
    assert_redirected_to taxon_concept_url(assigns(:taxon_concept))
  end
  
  def test_destroy
    taxon_concept = TaxonConcept.first
    delete :destroy, :id => taxon_concept
    assert_redirected_to taxon_concepts_url
    assert !TaxonConcept.exists?(taxon_concept.id)
  end
end
