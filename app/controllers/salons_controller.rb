class SalonsController < ApplicationController
  def index
    @salons = Salon.all
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
      redirect_to salon_menu_path(@salon)
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def show
    @salon = Salon.find(params[:id])
    @products = Product.where(salon_id: @salon)
  end

  def edit
    @salon = Salon.find(params[:id])
  end

  def update
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
    params.require(:salon).permit(:name, :address, :seller_info_id)
  end
end
