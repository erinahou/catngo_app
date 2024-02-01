class CatsController < ApplicationController

def new
  @cat = Cat.new
end

def create
    @cat = current_user.cats.build(cats_params)

    if @cat.save
      redirect_to root_path
    else
      render :new
    end
end

private

def cats_params
  params.require(:cat).permit(:name, :description, :age, :price_per_day)
end
end
