require 'test_helper'

class QuscoresControllerTest < ActionController::TestCase
  setup do
    @quscore = quscores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quscore" do
    assert_difference('Quscore.count') do
      post :create, quscore: {  }
    end

    assert_redirected_to quscore_path(assigns(:quscore))
  end

  test "should show quscore" do
    get :show, id: @quscore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quscore
    assert_response :success
  end

  test "should update quscore" do
    patch :update, id: @quscore, quscore: {  }
    assert_redirected_to quscore_path(assigns(:quscore))
  end

  test "should destroy quscore" do
    assert_difference('Quscore.count', -1) do
      delete :destroy, id: @quscore
    end

    assert_redirected_to quscores_path
  end
end
