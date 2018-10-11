class NotesChannel < ApplicationCable::Channel
  def subscribed
    # project = Project.find(params[:project_id])
    # stream_for project
    stream_from "notes_channel"
  end

  def unsubscribed
  end
end
