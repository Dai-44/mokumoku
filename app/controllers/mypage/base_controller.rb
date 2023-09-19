# frozen_string_literal: true

class Mypage::BaseController < ApplicationController
  layout 'mypage/layouts/application'
  before_action :require_login
  before_action :set_user

  private
  def set_user
    @user = if params[:id] && params[:id] != current_user.id
              User.find(params[:id])
            else
              current_user
            end
  end
end
