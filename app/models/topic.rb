class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  
  validates_presence_of :title, :user, :forum
  validates_associated :user, :forum
end