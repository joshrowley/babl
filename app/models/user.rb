class User < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :authorizations

  validates_presence_of :name, :email
  validates_uniqueness_of :email
end
