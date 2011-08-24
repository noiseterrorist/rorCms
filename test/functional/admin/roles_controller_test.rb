require 'test_helper'

class Admin::RolesControllerTest < ActionController::TestCase
  
  setup do
    @role = roles(:one)
    @some_role = {
      :name         => 'role_name',
      :description  => 'some_role description'
    }
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should crete role" do
    assert_difference('Role.count') do
      post :create, :role => @some_role
    end
    
    assert_redirected_to admin_role_path(assigns(:role))
  end
  
  test "should show role" do
    get :show, :id => @role.to_param
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => @role.to_param
    assert_response :success
  end
  
  test "should update role" do
    put :update, :id => @role.to_param, :role => @some_role
    assert_redirected_to admin_role_path(assigns(:product))
  end
  
  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete :destroy, :id => @role.to_param
    end
    
    assert_redirected_to admin_roles_url
  end
  
end
