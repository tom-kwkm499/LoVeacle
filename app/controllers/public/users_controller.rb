class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @cars = @user.cars
    @posts = Post.where(car_id: @cars.pluck(:id))
  end

  def show
  end

  def edit
  end
end
