class Task < ActiveRecord::Base
  attr_accessible :associated_doc, :description, :duedate, :name
end
