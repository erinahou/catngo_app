class ReviewsController < ApplicationController

  def new
    @cat = Cat.find(params[:cat_id])
    @review = Review.new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @review = @cat.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @cat, notice: 'Review was successfully created.'
    else
      flash.now[:alert] = 'Invalid review data. Please check your input.'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
