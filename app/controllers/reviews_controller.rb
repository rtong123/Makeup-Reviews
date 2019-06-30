class ReviewsController < ApplicationController

  def new
    #creates empty review with makeup
      @makeup = Makeup.find_by(id: params[:makeup_id])
      @review = @makeup.reviews.new
  end

  def create
    @makeup = Makeup.find_by(id: params[:makeup_id])
    @review = @makeup.reviews.new(review_params)
    #use the makeup id to write a review for that product
    if @review.save
      # @makeup.reviews << @review
      redirect_to makeup_review_path(@makeup)
    else
      redirect_to new_makeup_review_path
    end
  end

  def index
    @reviews = Review.all
    #shows all reviews for makeup
  end

  def show
    @makeup = Makeup.find_by(params[:makeup_id])
    binding.pry
    @reviews = @makeup.reviews
  end

private
def review_params
  params.require(:review).permit(:title, :content, :rating, :makeup_id).merge(:user_id => current_user.id)
end

end
