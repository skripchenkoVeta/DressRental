# frozen_string_literal: true

class SalonsController < ApplicationController
  NUMBER_ITEMS_PER_PAGE = 4
  def index
    @salons = Salon.includes(:seller_info).includes(:picture_attachment).all.page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
  end

  def menu
    @salons = current_user.profileable.salons
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.create(salon_params)
    if @salon
      flash[:success] = 'Success'
      redirect_to salon_menu_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def show
    @salon = Salon.find(params[:id])
    @products = Product.where(salon_id: @salon)

    if params[:search]
      search = params[:search]
      @products = @products.where('name like ?', "%#{search}%")
    end
    @products = @products.page params[:page]
  end

  def edit
    @salon = Salon.find(params[:id])
  end

  def update
    
    binding.pry
    
    @salon = Salon.find(params[:id])

    if @salon.update(salon_params)

      flash[:success] = 'Success'
      if current_user[:role] == 'Admin'
        redirect_to salons_path
      else
        redirect_to salon_menu_path
      end
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    @salon = Salon.find(params[:id])

    if @salon.destroy
      flash[:success] = 'Success'
      if current_user[:role] == 'Admin'
        redirect_to salons_path
      else
        redirect_to salon_menu_path
      end
    else
      flash[:error] = 'Error'
    end
  end

  private

  def salon_params
    params.require(:salon).permit(:name, :address, :seller_info_id, :picture)
  end
end
