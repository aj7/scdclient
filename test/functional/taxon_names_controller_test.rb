require 'test_helper'

class TaxonNamesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TaxonName.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TaxonName.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TaxonName.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to taxon_name_url(assigns(:taxon_name))
  end
  
  def test_edit
    get :edit, :id => TaxonName.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TaxonName.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TaxonName.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TaxonName.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TaxonName.first
    assert_redirected_to taxon_name_url(assigns(:taxon_name))
  end
  
  def test_destroy
    taxon_name = TaxonName.first
    delete :destroy, :id => taxon_name
    assert_redirected_to taxon_names_url
    assert !TaxonName.exists?(taxon_name.id)
  end
end
