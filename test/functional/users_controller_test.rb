require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:sam)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => {:login => 'nico', :email => 'nico@email.com', :password => 'fooey', :password_confirmation => 'fooey' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    login_as :aaron
    get :edit, id: users(:aaron).id
    assert_response :success
  end

  # test "should require valid user" do
  #   login_as :sam
  #   get :edit, :id => users(:aaron).id
  #   assert_redirected_to login_path
  # end
  
  test "should update user" do
    login_as :aaron
    put :update, id: @user.to_param, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to users_path
  end
end
