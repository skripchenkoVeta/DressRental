class AdminsController < ApplicationController
    def show
        @user = User.all
    end
end
