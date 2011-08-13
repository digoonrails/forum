require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # Replace this with your real tests
  test "display name" do
    assert_not_equal users(:aaron).display_name, users(:aaron).login
    assert_equal "sam", users(:sam).display_name
    # login overrules display_name when it is not present
    users(:aaron).update_attributes :display_name => ''
    assert_equal users(:aaron).login, users(:aaron).display_name
    users(:aaron).update_attributes :display_name => nil
    assert_equal users(:aaron).login, users(:aaron).display_name
  end
  
  test "first user becomes admin" do
    User.delete_all
    u=User.create(:email => "bob@uol.com", :password => "zoegirl", :password_confirmation => "zoegirl")
    u.login="bobby"
    assert u.save
    assert u.admin?
    u=User.create(:email => "woody@aol.com", :password => "zoegirl", :password_confirmation => "zoegirl")
    u.login="woody"
    assert ! u.admin?
  end

  test "no stupid logins" do
    u = users(:sam)
    %w(bob max123 imthemanbetyyoucanttouchme th_supaman).each do |login|
      u.login = login
      assert u.valid?
    end
    
    ['007', '123456789', 'f451', "sam'er", 'samm-ie', "<script>alert('im in ur base, killin ur d00ds')</script."].each do |login|
      u.login = login
      assert ! u.valid?
    end
  end
  
  test "login token" do
    assert_nil users(:aaron).login_key
    assert_nil users(:aaron).login_key_expires_at
    
    users(:aaron).reset_login_key!
    assert users(:aaron).login_key.length == 32
    assert users(:aaron).login_key_expires_at < Time.now.utc+1.year+1.minute
    assert users(:aaron).login_key_expires_at > Time.now.utc+1.year-1.minute
  end
  
end
