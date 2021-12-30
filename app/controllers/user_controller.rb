class UserController < ApplicationController
    def index
        @user = User.all
    end

    def conformation
     User.find(params[:user_conformation_id]).update(confirmed_at: DateTime.now)
        redirect_to user_index_path
    end
    def ban
        user = User.find(params[:user_ban_id]).profileable
        if user.freeze == true
            user.update(freeze: false)
            redirect_to user_index_path
        else
            user.update(freeze: true)
            redirect_to user_index_path
        end
    end
end
