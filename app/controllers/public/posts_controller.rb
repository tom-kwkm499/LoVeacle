class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
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

  end

  def destroy

  end
end

private

def post_params
  params.require(:post).permit(:title, :body)
end