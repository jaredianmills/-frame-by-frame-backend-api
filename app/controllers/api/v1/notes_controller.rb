class Api::V1::NotesController < ApplicationController
  before_action :find_note, only: [:show, :update]

  def index
    @notes = Note.all
    render json: @notes
  end

  def show
    render json: @note
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note
    else
      render json: {errors: "There was an error creating your note"}
    end
  end

  def update
    @note.update(note_params)
    if @note.save
      render json: @note, status: :accepted
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def note_params
    params.permit(:content, :timecode, :completed, :project_id, :user_id)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
