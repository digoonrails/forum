require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  def setup
    @controller = SessionsController.new
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    old = users(:aaron).last_seen_at
    post :create, :login => 'aaron', :password => 'testy'
    assert_redirected_to root_url
    assert_equal users(:aaron).id, session[:user_id]
    assert old != users(:aaron).reload.last_seen_at
    assert_equal old, @controller.send(:last_login)
  end
  
  test "remember me" do
    post :create, :login => 'aaron', :password => 'testy', :remember_me => "1"
    users(:aaron).reload
    
    assert cookies['login_token']
    assert_equal("1;#{users(:aaron).login_key}", cookies['login_token'])
    assert_not_nil users(:aaron).login_key
    assert_not_nil users(:aaron).login_key_expires_at
    
    # log off
    post :destroy
    assert_nil cookies['login_token']
    
    # make sure it change if log in again
    sleep 1
    old_login_key = users(:aaron).login_key; old_expires = users(:aaron).login_key_expires_at
    post :create, :login => 'aaron', :password => 'testy', :remember_me => '1'
    users(:aaron).reload
    
    assert_not_equal old_login_key, users(:aaron).login_key
    assert_not_equal old_expires, users(:aaron).login_key_expires_at
  end
  
  test "should fail login" do
    post :create, :login => 'aaron', :password => 'bad'
    assert_response :success
    assert_template 'new'
    assert_nil session[:user_id]
  end
end
