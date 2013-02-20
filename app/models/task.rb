class Task < ActiveRecord::Base
  attr_accessible :associated_doc, :description, :duedate, :name
  validates :name, :presence => true
  validates :name, :uniqueness => {:value => true, :message => "only one task with same name"}
  validates :description, :length => {:maximum => 50}
end
