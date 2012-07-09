require 'test_helper'

class BluetoothsControllerTest < ActionController::TestCase
  setup do
    @bluetooth = bluetooths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bluetooths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bluetooth" do
    assert_difference('Bluetooth.count') do
      post :create, :bluetooth => { :mac_addr => @bluetooth.mac_addr, :user_id => @bluetooth.user_id }
    end

    assert_redirected_to bluetooth_path(assigns(:bluetooth))
  end

  test "should show bluetooth" do
    get :show, :id => @bluetooth
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bluetooth
    assert_response :success
  end

  test "should update bluetooth" do
    put :update, :id => @bluetooth, :bluetooth => { :mac_addr => @bluetooth.mac_addr, :user_id => @bluetooth.user_id }
    assert_redirected_to bluetooth_path(assigns(:bluetooth))
  end

  test "should destroy bluetooth" do
    assert_difference('Bluetooth.count', -1) do
      delete :destroy, :id => @bluetooth
    end

    assert_redirected_to bluetooths_path
  end
end
