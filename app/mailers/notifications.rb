class Notifications < ActionMailer::Base
  default from: "notification@fionataskapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_task.subject
  #
  def new_task(email,task)
    @email = email
    @task = task
    @greeting = "Hi! You made a new task!"

    mail to: email
  end

  def user_added_to_project(email,project, addername)
    @email = email
    @project = project
    @addername = addername
    @greeting = "Hi! A new user has been added to a project at GetItDone!"

    mail to: email
  end

end
