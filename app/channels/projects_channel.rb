class ProjectsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "projects_channel_#{params[:id]}"
  end

  def unsubscribed
  end
end
