# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/buyer
    def buyer
      build_resource
      yield resource if block_given?
      respond_with resource
    end

    # GET /resource/seller
    def seller
      build_resource
      yield resource if block_given?
      respond_with resource
    end

    # POST /resource
    def create
      if sign_up_params[:profileable_type] == 'SellerInfo'
        seller_info = SellerInfo.create(sign_up_seller_params)
        user_sign_up_params = sign_up_params.merge(profileable_id: seller_info.id).except(:seller_infos)
      else
        buyer_info = BuyerInfo.create(sign_up_buyer_params)
        user_sign_up_params = sign_up_params.merge(profileable_id: buyer_info.id).except(:buyer_infos)
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
        resource.errors.full_messages.each { |x| flash[:notice] = x }
        if user_sign_up_params[:role] == 'Seller'
          redirect_to users_seller_path
        else
          redirect_to users_buyer_path
        end
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
      param_keys = [:attribute, :name, :number, :surname, :role, :profileable_type, :profileable_id,
                    { seller_infos: sign_up_seller_keys, buyer_infos: sign_up_buyer_keys }]

      devise_parameter_sanitizer.permit(:sign_up, keys: param_keys)
    end

    def sign_up_seller_keys
      %i[kpp unp supplier_name seller_type_id freeze]
    end

    def sign_up_seller_params
      params.require(:user).require(:seller_infos).permit(sign_up_seller_keys)
    end

    def sign_up_buyer_keys
      %i[address birthday freeze]
    end

    def sign_up_buyer_params
      params.require(:user).require(:buyer_infos).permit(sign_up_buyer_keys)
    end
  end
end
