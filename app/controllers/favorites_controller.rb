class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    #お気に入りすべき投稿のmicropost_idをparams[:micropost_id]として取得する
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
