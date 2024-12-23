class Api::V1::CafesController < ApplicationController
  def index
    # If the user searches by title return all cafes with similar titles from our DB
    if params[:title]
      @cafes = Cafe.where("title ILIKE ?", "%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end

    # Put the most recently created cafes first
    render json: @cafes.order(created_at: :desc)
  end
end
