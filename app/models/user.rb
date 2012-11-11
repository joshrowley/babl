class User < ActiveRecord::Base
  attr_accessible :name, :email

  #3.2.3
  has_many :authorizations

  #3.2.5
  validates_uniqueness_of :email
end
