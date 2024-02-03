class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard
  def home
    @cats = Cat.all
  end

  def dashboard
    if user_signed_in?
      @user = current_user
      @recent_cats = @user.cats.order(created_at: :desc).limit(5)
    else
      redirect_to new_user_session_path
    end
  end
end
