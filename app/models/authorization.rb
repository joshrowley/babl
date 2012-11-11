class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  
  #3.2.3
  belongs_to :user

  #3.2.4
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

end
