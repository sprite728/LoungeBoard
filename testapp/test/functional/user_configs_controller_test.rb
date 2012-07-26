require 'test_helper'

class UserConfigsControllerTest < ActionController::TestCase
  setup do
    @user_config = user_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_config" do
    assert_difference('UserConfig.count') do
      post :create, :user_config => {  }
    end

    assert_redirected_to user_config_path(assigns(:user_config))
  end

  test "should show user_config" do
    get :show, :id => @user_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_config
    assert_response :success
  end

  test "should update user_config" do
    put :update, :id => @user_config, :user_config => {  }
    assert_redirected_to user_config_path(assigns(:user_config))
  end

  test "should destroy user_config" do
    assert_difference('UserConfig.count', -1) do
      delete :destroy, :id => @user_config
    end

    assert_redirected_to user_configs_path
  end
end
