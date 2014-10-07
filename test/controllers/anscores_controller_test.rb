require 'test_helper'

class AnscoresControllerTest < ActionController::TestCase
  setup do
    @anscore = anscores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anscore" do
    assert_difference('Anscore.count') do
      post :create, anscore: {  }
    end

    assert_redirected_to anscore_path(assigns(:anscore))
  end

  test "should show anscore" do
    get :show, id: @anscore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anscore
    assert_response :success
  end

  test "should update anscore" do
    patch :update, id: @anscore, anscore: {  }
    assert_redirected_to anscore_path(assigns(:anscore))
  end

  test "should destroy anscore" do
    assert_difference('Anscore.count', -1) do
      delete :destroy, id: @anscore
    end

    assert_redirected_to anscores_path
  end
end
