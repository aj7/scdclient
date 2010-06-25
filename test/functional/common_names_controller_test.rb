require 'test_helper'

class CommonNamesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => CommonName.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    CommonName.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    CommonName.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to common_name_url(assigns(:common_name))
  end
  
  def test_edit
    get :edit, :id => CommonName.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    CommonName.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CommonName.first
    assert_template 'edit'
  end
  
  def test_update_valid
    CommonName.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CommonName.first
    assert_redirected_to common_name_url(assigns(:common_name))
  end
  
  def test_destroy
    common_name = CommonName.first
    delete :destroy, :id => common_name
    assert_redirected_to common_names_url
    assert !CommonName.exists?(common_name.id)
  end
end
