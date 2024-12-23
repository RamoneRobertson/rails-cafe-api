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

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      render json: @cafe, status: :created
    else
      render json: { error: @cafe.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end
