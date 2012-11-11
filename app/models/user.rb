class User < ActiveRecord::Base
  attr_accessible :name

  has_many :authorizations
end
