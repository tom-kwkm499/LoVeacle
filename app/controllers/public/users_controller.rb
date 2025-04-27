class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @cars = @user.cars
  end

  def show
  end

  def edit
  end
end
