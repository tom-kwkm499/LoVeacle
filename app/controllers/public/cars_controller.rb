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
  end

  def update
  end

  def destroy
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer, :car_name, :model_code, :trim_level)
  end

end
