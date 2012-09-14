class Role < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :designations
  attr_accessible :name, :role_name

end
