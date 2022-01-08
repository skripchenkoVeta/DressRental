class RentalsController < ApplicationController
 
  # GET /rentals or /rentals.json
  def index
    if current_user[:role] == 'Buyer'
    @rentals = Rental.where(buyer_info_id: current_user.profileable)
    else
      @list_salons = current_user.profileable.salons
    @list_products = Product.where(salon_id: @list_salons)
    @rentals = Rental.where(product_id: @list_products)
    end
  end

  # GET /rentals/1 or /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    @product = Product.find(params[:format])
  end
  def approve
    rent = Rental.find(params[:approve_id])
    rent.update(approve: true)
    rent.update(status: true)
    redirect_to rentals_path
  end
  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)

      if @rental.save
        flash[:success] = 'Success'
        redirect_to home_catalog_path
      else
        flash[:error] = 'Error'
        render :new
      end

  end

  # PATCH/PUT /rentals/1 or /rentals/1.json
  def update
    respond_to do |format|
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
    @rental.destroy
    if @rental.destroy
      flash[:success] = 'Success'
      redirect_to home_catalog_path
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
      params.require(:rental).permit(:status,:start_rent,:end_rent,:buyer_info_id, :product_id,:approve)
    end
end
