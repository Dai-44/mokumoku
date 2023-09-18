# frozen_string_literal: true

class Mypage::ProfilesController < Mypage::BaseController
  def show
    @user = if params[:id] && params[:id] != current_user.id
              User.find(params[:id])
            else
              current_user
            end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(profile_params)
      redirect_to mypage_profile_path, success: 'プロフィールを更新しました'
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :avatar, :email, :hobby, :profile)
  end
end
