# frozen_string_literal: true

class UserController < ApplicationController
  NUMBER_ITEMS_PER_PAGE = 19
  def index
    @user = User.includes(:profileable).all.page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
  end

  def confirmation
    User.find(params[:user_confirmation_id]).update(confirmed_at: DateTime.now)
    user = User.find(params[:user_confirmation_id])
    UserMailer.with(user: user).welcome_email.deliver_now
    redirect_to user_index_path
  end

  def ban
    user = User.find(params[:user_ban_id]).profileable
    if user.freeze == true
      user.update(freeze: false)
    else
      user.update(freeze: true)
    end
    redirect_to user_index_path
  end
end
