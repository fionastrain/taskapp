class Task < ActiveRecord::Base
  attr_accessible :associated_doc, :description, :duedate, :name, :document_id, :teammate_id
  validates :name, :presence => true
  validates :name, :uniqueness => {:value => true, :message => "only one task with same name"}
  validates :description, :length => {:maximum => 50}
  has_many :users
  has_one :document
  scope :due_soon, where(":due_date >= (Time.now.next_week..Time.now.next_week.end_of_week)")
end
