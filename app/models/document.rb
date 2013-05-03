class Document < ActiveRecord::Base
  attr_accessible :datemodified, :name, :docurl, :project_id
  validates :name, :presence => true
  validates :docurl, :presence => true
  belongs_to :project

  def getprojectname(projectid)
    if(@projectid.nil?)
      pro = "No Associated Project"
    else
      pro =  Project.find(projectid).name
    end
  end

  def checkurl
    unless self.docurl[/^http:\/\//] || self.docurl[/^https:\/\//]
      self.docurl = 'http://' + self.docurl
    end
  end
end
