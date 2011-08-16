require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:rails)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums)
  end

  test "should get new" do
    login_as :aaron
    get :new
    assert_response :success
  end
  
  test "should require admin" do
    login_as :sam
    get :new
    assert_redirected_to login_path
  end

  test "should create forum" do
    login_as :aaron
    assert_difference('Forum.count') do
      post :create, forum: @forum.attributes
    end

    assert_redirected_to forum_path(assigns(:forum))
  end

  test "should show forum" do
    get :show, id: @forum.to_param
    assert_response :success
  end

  test "should get edit" do
    login_as :aaron
    get :edit, id: @forum.to_param
    assert_response :success
  end

  test "should update forum" do
    login_as :aaron
    put :update, id: @forum.to_param, forum: @forum.attributes
    assert_redirected_to forum_path(assigns(:forum))
  end

  test "should destroy forum" do
    login_as :aaron
    assert_difference('Forum.count', -1) do
      delete :destroy, id: @forum.to_param
    end

    assert_redirected_to forums_path
  end
end
