class Public::CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to users_mypage_path, notice: '車両が登録されました。'
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = current_user.cars.find(params[:id])
    if @car.update(car_params)
      redirect_to users_mypage_path, notice: "車両情報を更新しました。"
    else
      flash.now[:alert] = "車両情報の更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = current_user.cars.find(params[:id])
    @car.destroy
    redirect_to users_mypage_path, notice: "車両を削除しました。"
  end

  private

  def car_params
    params.require(:car).permit(
      :manufacturer, 
      :car_name, 
      :model_code, 
      :trim_level, 
      :is_owned, 
      :car_image, 
      :ownership_start_date, 
      :ownership_end_date
    )
  end

end
