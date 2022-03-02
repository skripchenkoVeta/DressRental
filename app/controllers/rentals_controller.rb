# frozen_string_literal: true

class RentalsController < ApplicationController
  NUMBER_ITEMS_PER_PAGE = 7
  # GET /rentals or /rentals.json
  def index
    if current_user[:role] == 'Buyer'
      @rentals =
        if params[:finished]
          Rental.where(buyer_info_id: current_user.profileable, status: false,
                       approve: true).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
        elsif params[:rental]
          Rental.where(buyer_info_id: current_user.profileable, status: true,
                       approve: true).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
        else
          Rental.where(buyer_info_id: current_user.profileable).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
        end
    else
      @list_salons = current_user.profileable.salons
      @list_products = Product.where(salon_id: @list_salons)
      @rentals =
        if params[:finished]
          Rental.where(product_id: @list_products, status: false,
                       approve: true).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
        elsif params[:rental]
          Rental.where(product_id: @list_products, status: true,
                       approve: true).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
        else
          Rental.where(product_id: @list_products).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
        end
    end
  end

  # GET /rentals/1 or /rentals/1.json
  def show
    @rent = Rental.find(params[:id])
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    authorize @rental
    @product = Product.find(params[:format])
  end

  def status
    rent = Rental.find(params[:status_id])
    rent.update(status: false)
    redirect_to rentals_path
  end

  def sanction
    rent = Rental.find(params[:rent_id])
    UserMailer.with(user: rent).sanction.deliver_now
    redirect_to rentals_path
  end

  def approve
    rent = Rental.find(params[:approve_id])
    rent.update(approve: true, status: true)
    UserMailer.with(user: rent).approved.deliver_now
    redirect_to rentals_path
  end

  # GET /rentals/1/edit
  def edit; end

  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      UserMailer.with(user: @rental).create_of_rental.deliver_now
      flash[:success] = 'Success'
      redirect_to home_catalog_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  # PATCH/PUT /rentals/1 or /rentals/1.json
  def update
    respond_to do |_format|
      if @rental.update(rental_params)
        flash[:success] = 'Success'
        redirect_to home_catalog_path
      else
        flash[:error] = 'Error'
        render :edit
      end
    end
  end

  # DELETE /rentals/1 or /rentals/1.json
  def destroy
    @rental = Rental.find(params[:id])
    if @rental.destroy
      UserMailer.with(user: @rental).rejected.deliver_now
      flash[:success] = 'Success'
      redirect_to rentals_path
    else
      flash[:error] = 'Error'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rental
    @rental = Rental.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rental_params
    params.require(:rental).permit(:status, :start_rent, :end_rent, :buyer_info_id, :product_id, :approve, :size_id)
  end
end
