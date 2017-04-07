require 'test_helper'

class NewparentsControllerTest < ActionController::TestCase
  setup do
    @newparent = newparents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newparents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newparent" do
    assert_difference('Newparent.count') do
      post :create, newparent: { phone_num: @newparent.phone_num }
    end

    assert_redirected_to newparent_path(assigns(:newparent))
  end

  test "should show newparent" do
    get :show, id: @newparent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newparent
    assert_response :success
  end

  test "should update newparent" do
    patch :update, id: @newparent, newparent: { phone_num: @newparent.phone_num }
    assert_redirected_to newparent_path(assigns(:newparent))
  end

  test "should destroy newparent" do
    assert_difference('Newparent.count', -1) do
      delete :destroy, id: @newparent
    end

    assert_redirected_to newparents_path
  end
end
