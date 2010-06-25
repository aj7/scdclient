require 'test_helper'

class ::?sControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ::?.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ::?.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ::?.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to /?_url(assigns(:/?))
  end
  
  def test_edit
    get :edit, :id => ::?.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ::?.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ::?.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ::?.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ::?.first
    assert_redirected_to /?_url(assigns(:/?))
  end
  
  def test_destroy
    /? = ::?.first
    delete :destroy, :id => /?
    assert_redirected_to /?s_url
    assert !::?.exists?(/?.id)
  end
end
