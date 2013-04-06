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
end
