class ReviewsController < ApplicationController

  def index
    reviews = Review.all.order(rating: :desc)
    render json: reviews, include: { dog_house: {except: [:updated_at, :created_at]} }, except: [:updated_at, :created_at], status: :ok
  end

end
