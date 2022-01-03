class ProductTypesController < ApplicationController
    def index
        @product_type = ProductType.all
    end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.create(product_type_params)
    if @product_type
      flash[:success] = 'Success'
      redirect_to product_types_path(@product_type)
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def show
    @product_type = ProductType.all
  end

  def edit
    @product_type = ProductType.find(params[:id])
  end

  def update
    @product_type = ProductType.find(params[:id])

    if @product_type.update(product_type_params)
      flash[:success] = 'Success'
      redirect_to product_types_path
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])

    if @product_type.destroy
      flash[:success] = 'Success'
      redirect_to product_types_path
    else
      flash[:error] = 'Error'
    end
  end

  private

  def product_type_params
    params.require(:product_type).permit(:name)
  end

end
