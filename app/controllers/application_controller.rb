class ApplicationController < ActionController::Base
  def tasksduesoon
    @dues = Task.due_soon


  end
end

