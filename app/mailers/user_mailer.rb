# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Добро пожаловать в Dress Rental')
  end

  def create_of_rental
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.product.salon.seller_info.user.email, subject: 'Заявка на аренду')
  end

  def create_of_rental_buyer
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.buyer_info.user.email, subject: 'Уведомление об отправке заявки на аренду')
  end

  def approved
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.buyer_info.user.email, subject: 'Ваша заявка на аренду была одобрена!')
  end

  def rejected
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.buyer_info.user.email, subject: 'Ваша заявка на аренду была отклонена!')
  end

  def sanction
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.buyer_info.user.email, subject: 'Дорогой пользователь DressRental')
  end
end
