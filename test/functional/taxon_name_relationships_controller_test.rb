require 'test_helper'

class TaxonNameRelationshipsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TaxonNameRelationship.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TaxonNameRelationship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TaxonNameRelationship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to taxon_name_relationship_url(assigns(:taxon_name_relationship))
  end
  
  def test_edit
    get :edit, :id => TaxonNameRelationship.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TaxonNameRelationship.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TaxonNameRelationship.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TaxonNameRelationship.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TaxonNameRelationship.first
    assert_redirected_to taxon_name_relationship_url(assigns(:taxon_name_relationship))
  end
  
  def test_destroy
    taxon_name_relationship = TaxonNameRelationship.first
    delete :destroy, :id => taxon_name_relationship
    assert_redirected_to taxon_name_relationships_url
    assert !TaxonNameRelationship.exists?(taxon_name_relationship.id)
  end
end
