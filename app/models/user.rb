class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  # attr_accessible :title, :body
  has_many :tasks
  has_and_belongs_to_many :projects

  def getalltasks
       assoctasks = Task.where(:project_id => self.project_ids)
  end

  def sendnotification(projectid)
    @proj = Project.find(projectid)
    @proj.user_ids.each do |userid|
      @email = User.find(userid).email
      Notifications.user_added_to_project(@email, @proj, self.name).deliver
    end
  end

end
