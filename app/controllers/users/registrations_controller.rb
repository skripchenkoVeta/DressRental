# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up

    def buyer
      build_resource
      yield resource if block_given?
      respond_with resource
    end

    # POST /resource
    def create
      if sign_up_params[:profileable_type] == 'SellerInfo'
        seller_info = SellerInfo.create(sign_up_seller_params)
        user_sign_up_params = sign_up_params.merge(profileable_id: seller_info.id)
      else
        buyer_info = BuyerInfo.create(sign_up_buyer_params)
        user_sign_up_params = sign_up_params.merge(profileable_id: buyer_info.id)
      end
      build_resource(user_sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    # GET /resource/edit

    # PUT /resource

    # DELETE /resource

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: %i[attribute name number surname role profileable_type profileable_id])
    end

    def sign_up_seller_params
      params.require(:user).require(:seller_infos).permit(:kpp, :unp, :supplier_name, :seller_type_id, :freeze)
    end

    def sign_up_buyer_params
      params.require(:user).require(:buyer_infos).permit(:address, :birthday, :freeze)
    end

    def death
      sign_up_params.require(:user).require(:seller_infos).permit(:kpp, :unp, :supplier_name, :seller_type_id, :freeze)
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

    # The path used after sign up.

    # The path used after sign up for inactive accounts.
  end
end
