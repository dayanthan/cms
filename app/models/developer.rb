class Developer < ActiveRecord::Base
  attr_accessible :date, :designation, :manager, :name, :role
end
