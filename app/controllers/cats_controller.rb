class CatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @booking = Booking.new
    @reviews = @cat.reviews
  end

  def new
    @cat = Cat.new
  end

  def create
      @cat = current_user.cats.build(cats_params)

      if @cat.save
        redirect_to dashboard_path
      else
        render :new
      end
  end

  def edit
    @cat = Cat.find(params[:id])
    redirect_to dashboard_path unless can_edit_cat?(@cat)
  end

  def update
    @cat = Cat.find(params[:id])

    if can_edit_cat?(@cat)
      @cat.update(cats_params)
      redirect_to dashboard_path
    else
      redirect_to root_path, alert: "This isnt your cat!"
    end
  end

  def destroy
    @cat = Cat.find(params[:id])

    if can_edit_cat?(@cat)
      @cat.destroy
      redirect_to cat_path(@cat), notice: "Cat deleted successfully."
    else
      redirect_to root_path, alert: "This isnt your cat!"
    end
  end

  private

  def cats_params
    params.require(:cat).permit(:name, :description, :age, :price_per_day, :photo)
  end

  def can_edit_cat?(cat)
    cat.user == current_user
  end

end
