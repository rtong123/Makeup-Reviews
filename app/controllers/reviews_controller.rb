class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    binding.pry
    @review = Review.new(review_params)
    if @review.save
    @review.user_id = session.id
    binding.pry
    #attach the makeup with the review
    @review.makeup_id = makeup.id
  end

  def index
    @reviews = Review.all
  end

private
def review_params
  params.require(:makeup).permit(:title, :content, :rating)
end

end
