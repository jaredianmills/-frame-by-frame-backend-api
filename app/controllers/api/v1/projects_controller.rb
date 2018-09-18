class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def new
    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      render json: {errors: "There was an error creating your project"}
    end
  end

  def update
    @project.update(project_params)
    if @project.save
      render json: @project, status: :accepted
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :video_url, :users, :notes, :comments)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
