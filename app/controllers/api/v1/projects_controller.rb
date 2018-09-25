class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update]
  before_action :set_storage_url, only: [:create, :show]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(title: project_params[:title], video: project_params[:video])
    user = User.find(project_params[:user_id])
    @project.users << user
    if @project.save
      # @project.video.purge
      @project.video.attach(params[:video])
      @project.video_url = @project.video.service_url
      # @project.video_url = url_for(@project.video)
      @project.save
      render json: @project
    else
      render json: { errors: @project.errors.full_messages }
      {errors: "There was an error creating your project"}
    end
  end

  def update
    if user = User.find_by(email: project_params[:user_email])
      @project.users << user
    else
      byebug
      render json: { errors: "Unable to find that user"}, status: :unprocessible_entity
    end
    # user = User.find_by(email: project_params[:user_email])
    # @project.update(project_params)
    # if @project.save
    #   render json: @project, status: :accepted
    # else
    #   render json: { errors: @project.errors.full_messages }, status: :unprocessible_entity
    # end
  end

  private

  def project_params
    params.permit(:title, :video, :user_id, :user_email)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def set_storage_url
    ActiveStorage::Current.host = request.base_url
  end

end
