# frozen_string_literal: true

class ProductsController < ApplicationController
  NUMBER_ITEMS_PER_PAGE_INDEX = 4
  NUMBER_ITEMS_PER_PAGE = 9

  def index
    @products = Product.includes(:salon).includes(:product_type).includes(:avatar_attachment).all.page(params[:page]).per(NUMBER_ITEMS_PER_PAGE_INDEX)
  end

  def menu
    @list_salons = current_user.profileable.salons
    @products = Product.includes(:salon).includes(:avatar_attachment).where(salon_id: @list_salons).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
  end

  def show
    @product = Product.find(params[:id])
    @another_products = Product.where(product_type_id: @product.product_type.id).sample(4)
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.create(product_params)
    if @product
      flash[:success] = 'Success'
      redirect_to product_menu_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
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
    authorize @product
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
    params.require(:product).permit(:name, :description, :price, :product_type_id, :salon_id, :avatar)
  end
end
