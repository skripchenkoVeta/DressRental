# frozen_string_literal: true

class MyMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  #default template_path: 'users/mailer' # to make sure that your mailer uses the devise views
  # If there is an object in your application that returns a contact email, you can use it as follows
  # Note that Devise passes a Devise::Mailer object to your proc, hence the parameter throwaway (*).

  include Devise::Mailers::Helpers

  def confirmation_instructions(record, token, opts = {})
    @token = token
    @role = record[:role]
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts = {})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts = {})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end

  def email_changed(record, opts = {})
    devise_mail(record, :email_changed, opts)
  end

  def password_change(record, opts = {})
    devise_mail(record, :password_change, opts)
  end
end
