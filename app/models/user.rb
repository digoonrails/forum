class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  validates_format_of       :login, :with => /^[a-zA-Z]{2}(\w+)?$/
  validates_length_of       :login, :minimum => 2
  
end
