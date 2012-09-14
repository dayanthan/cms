class Department < ActiveRecord::Base
  attr_accessible :designation, :email, :manager, :name, :role
end
