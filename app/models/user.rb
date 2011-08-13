class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  validates :login, :email, :password, :presence => true
  # validates :login, :email, :uniqueness => true, :case_sensitive => false
  validates_format_of       :login, :with => /^[a-zA-Z]{2}(\w+)?$/
  validates_length_of       :login, :minimum => 2
  
  before_validation { |u| u.display_name = u.login if u.display_name.blank? }
  # first user becomes admin automatically
  before_create { |u| u.admin = true if User.count == 0 }
  
  def reset_login_key!
    self.login_key = Digest::MD5.hexdigest( Time.now.to_s + self.password + rand(123456789).to_s ).to_s
    # this is not currently honored
    self.login_key_expires_at = Time.now.utc+1.year
    save!
    login_key
  end
end
