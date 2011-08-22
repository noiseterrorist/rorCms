require 'test_helper'

class Admin::IndexControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    get :index
    assert_response :success
    assert_recognizes({ :controller => 'admin/index', :action => 'index'}, '/admin')
  end
end
