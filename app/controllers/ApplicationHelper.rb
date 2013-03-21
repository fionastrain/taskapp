class ApplicationHelper
  def tasksdue
    Tasks.due_soon
  end

end