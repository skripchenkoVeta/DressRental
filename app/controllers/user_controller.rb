# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @user = User.all
  end

  def confirmation
    User.find(params[:user_confirmation_id]).update(confirmed_at: DateTime.now)
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
