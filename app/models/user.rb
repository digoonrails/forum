class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  validates :login, :email, :password, :presence => true
  # validates :login, :email, :uniqueness => true, :case_sensitive => false
  validates_format_of       :login, :with => /^[a-zA-Z]{2}(\w+)?$/
  validates_length_of       :login, :minimum => 2
  
  before_create { |u| u.admin = true if User.count == 0 }
end
