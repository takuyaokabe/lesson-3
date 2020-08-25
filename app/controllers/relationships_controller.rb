class RelationshipsController < ApplicationController

  def create
  	@user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
#findメソッドを使う 。userの情報を取得する。userに関連づいているfollower一覧を取得する（アソシエーション）で取得する２行にわたって書くこと。
#Userとrelashonshipとfollow関係のアソシエーションによってどんなデータが取れるのか明確に理解できるように一度簡単な図式で関係性を示すこと。
#userのfindする際どんなパラメーターが渡っているのか確認すること。
  def followindex
    @user = User.find(params[:user_id])
  end

    def followerindex
    @user = User.find(params[:user_id])
  
  end

  def destroy
  	@user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
end
