class Project < ActiveRecord::Base
  attr_accessible :name,  :teammate_id, :user_ids
  has_and_belongs_to_many :users
  has_many :tasks

 def addCreatorToProject(userid)
   u = User.find(userid)
   self.users << u
 end
end
