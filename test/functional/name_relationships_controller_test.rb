require 'test_helper'

class NameRelationshipsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => NameRelationship.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    NameRelationship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    NameRelationship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to name_relationship_url(assigns(:name_relationship))
  end
  
  def test_edit
    get :edit, :id => NameRelationship.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    NameRelationship.any_instance.stubs(:valid?).returns(false)
    put :update, :id => NameRelationship.first
    assert_template 'edit'
  end
  
  def test_update_valid
    NameRelationship.any_instance.stubs(:valid?).returns(true)
    put :update, :id => NameRelationship.first
    assert_redirected_to name_relationship_url(assigns(:name_relationship))
  end
  
  def test_destroy
    name_relationship = NameRelationship.first
    delete :destroy, :id => name_relationship
    assert_redirected_to name_relationships_url
    assert !NameRelationship.exists?(name_relationship.id)
  end
end
