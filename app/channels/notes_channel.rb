class NotesChannel < ApplicationCable::Channel
  def subscribed
    project = Project.find(params[:project_id])
    stream_for project
  end

  def unsubscribed
  end
end
