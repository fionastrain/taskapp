class Project < ActiveRecord::Base
  attr_accessible :name,  :teammate_id, :user_ids
  has_and_belongs_to_many :users
  has_many :tasks
  has_many :documents

 def addCreatorToProject(userid)
   u = User.find(userid)
   self.users << u
 end

  def getnames
    @stringtoret = ""
    @userstosend = User.where(:id => self.user_ids)
    @userstosend.each do |user|
      if @stringtoret == ""
        @stringtoret = user.name
      else
       @stringtoret = @stringtoret + ", " + user.name
      end
    end
    return @stringtoret
  end
end
