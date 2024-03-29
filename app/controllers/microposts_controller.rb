class MicropostsController < ApplicationController
  before_action :correct_user, only: %i(destroy)
  before_action :logged_in_user, only: %i(create destroy)

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to home_url
    else
      @feed_items = current_user.feed.page(params[:page])
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = "Micropost deleted"
    else
      flash[:danger] = "Deleted fail"
    end
    redirect_to request.referer || home_url
  end

  private

  def micropost_params
    params.require(:micropost).permit :content, :image
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    return if @micropost
    flash[:danger] = "Micropost invalid"
    redirect_to request.referrer || home_url
  end
end
