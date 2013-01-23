class Task < ActiveRecord::Base
  attr_accessible :description, :duedate, :name
end
