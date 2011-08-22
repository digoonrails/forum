require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "first user becomes admin" do
    
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
