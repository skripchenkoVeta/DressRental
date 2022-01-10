class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to Dress Rental')
    end
    def create_of_rental
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.product.salon.seller_info.user.email, subject: 'New application on rental')
    end
    def approved
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.buyer_info.user.email, subject: 'Your rental application was approved!')
    end
    def rejected
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.buyer_info.user.email, subject: 'Your rental application was rejected')
    end
end
