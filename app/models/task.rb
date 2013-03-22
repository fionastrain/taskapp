class Task < ActiveRecord::Base
  attr_accessible :associated_doc, :description, :duedate, :name, :document_id, :teammate_id, :completed
  validates :name, :presence => true
  validates :name, :uniqueness => {:value => true, :message => "only one task with same name"}
  validates :description, :length => {:maximum => 50}
  has_many :users
  has_one :document
  scope :due_soon, lambda { where(:duedate => (Date.today..Date.today.advance(:weeks => 1)))}
  scope :incomplete, where(:completed => false)
  scope :complete, where(:completed => true)


  def default_values
    self.completed = false
  end


end
