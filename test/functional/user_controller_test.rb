require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
