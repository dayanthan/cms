class Designation < ActiveRecord::Base
  belongs_to :user
has_and_belongs_to_many :roles
  attr_accessible :name ,:designation

end
