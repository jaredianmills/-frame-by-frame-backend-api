class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update]
  before_action :set_storage_url, only: [:create, :show]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
    # serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #     ProjectSerializer.new(@project)
    #   ).serializable_hash
    # ActionCable.server.broadcast 'projects_channel', serialized_data
  end

  def create
    @project = Project.new(title: project_params[:title])
    @project.video.attach(project_params[:video])
    @project.video_url = url_for(@project.video)
    user = User.find(project_params[:user_id])
    @project.users << user
    if @project.save
      @project.save
      render json: @project
    else
      render json: {error: "There was an error creating your project"}
    end
  end

  def update
    if user = User.find_by(email: project_params[:user_email])
      if !user.projects.include?(@project)
        @project.users << user
        render json: @project
      else
        render json: { errors: "That user already has access to this project"}, status: :unprocessible_entity
      end
    else
      render json: { errors: "Unable to find that user"}, status: :unprocessible_entity
    end
  end

  private

  def project_params
    params.permit(:title, :user_id, :video, :video_url, :user_email)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def set_storage_url
    ActiveStorage::Current.host = request.base_url
  end

end
