class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_task.subject
  #
  def new_task(email)
    @email = email
    @greeting = "Hi! You made a new task!"

    mail to: email
  end
end
