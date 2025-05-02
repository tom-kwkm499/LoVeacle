class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @cars = @user.cars
    @posts = Post.where(car_id: @cars.pluck(:id))
    @owned_cars = @cars.select(&:is_owned)
    @past_cars = @cars.reject(&:is_owned)
  end

  def show

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: "アカウント情報を更新しました。"
    else
      flash.now[:alert] = "アカウント情報の更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :profile_image
    )
  end

end
