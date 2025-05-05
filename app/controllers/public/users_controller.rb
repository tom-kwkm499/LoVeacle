class Public::UsersController < ApplicationController
  def mypage
    @user = current_user 
    @cars = @user.cars
    @owned_cars = @cars.select(&:is_owned)
    @past_cars = @cars.reject(&:is_owned)

    @posts = Post.where(car_id: @cars.pluck(:id)).order(created_at: :desc) 
    #@cars に含まれるすべての車両（Car）の id だけを配列で取り出す処理.新しいものから並べる
  end

  def show
    if current_user.id == params[:id].to_i
      redirect_to users_mypage_path
    else
      @user = User.find(params[:id])
      @cars = @user.cars
      @owned_cars = @cars.select(&:is_owned)
      @past_cars = @cars.reject(&:is_owned)

      @posts = Post.where(car_id: @cars.pluck(:id)).order(created_at: :desc) 
    end
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
