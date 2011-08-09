require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
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

end
