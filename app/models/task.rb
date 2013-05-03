class Task < ActiveRecord::Base
  attr_accessible :description, :duedate, :name,  :completed, :project_id
  validates :name, :presence => true
  validates :name, :uniqueness => {:value => true, :message => "only one task with same name"}
  validates :description, :length => {:maximum => 50}
  validates :project_id, :presence => true

  has_one :document
  belongs_to :project

  scope :due_soon, lambda { where(:duedate => (Date.today..Date.today.advance(:weeks => 1)))}
  scope :incomplete, where(:completed => false)
  scope :complete, where(:completed => true)



  def default_values
    self.completed = false
  end

  def getprojectname(projectid)
    if(projectid.nil?)
      pro = "No Associated Project"
    else
      pro =  Project.find(projectid).name
      end
  end






end
