class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    dogs_houses = DogHouse.all
    render json: dogs_houses, include: {reviews: {except: [:updated_at, :created_at]}}, except: [:updated_at, :created_at], status: :ok
  end
  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house, include: {reviews: {except: [:updated_at, :created_at]} }, except: [:updated_at, :created_at], status: :ok
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
