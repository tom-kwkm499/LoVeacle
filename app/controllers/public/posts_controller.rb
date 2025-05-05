class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @user = current_user 
    @cars = @user.cars
    @owned_cars = @cars.select(&:is_owned)
    @past_cars = @cars.reject(&:is_owned)

    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @car = Car.find(params[:car_id])
    @post = @car.posts.new(post_params)
    if @post.save
      redirect_to user_car_post_path(@car.user, @car, @post), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_car_post_path(@post.car.user, @post.car, @post), notice: "投稿情報を更新しました。"
    else
      flash.now[:alert] = "投稿情報の更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_mypage_path, notice: "投稿を削除しました。"
  end

private

def post_params
  params.require(:post).permit(
    :title,
    :body,
    :post_image
  )
end

end