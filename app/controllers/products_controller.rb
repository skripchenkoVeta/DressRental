# frozen_string_literal: true

class ProductsController < ApplicationController
  NUMBER_ITEMS_PER_PAGE = 19
  def index
    @products = Product.all.page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
  end

  def menu
    @list_salons = current_user.profileable.salons
    @products = Product.where(salon_id: @list_salons)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product
      flash[:success] = 'Success'
      redirect_to product_menu_path(@product)
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:success] = 'Success'
      if current_user[:role] == 'Admin'
        redirect_to products_path
      else
        redirect_to product_menu_path
      end
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash[:success] = 'Success'
      if current_user[:role] == 'Admin'
        redirect_to products_path
      else
        redirect_to product_menu_path
      end
    else
      flash[:error] = 'Error'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :product_type_id, :salon_id)
  end
end
