# frozen_string_literal: true

class SizesController < ApplicationController
  NUMBER_ITEMS_PER_PAGE = 4

  def index
    @product = Product.find(params[:id])
    @sizes = Size.where(product_id: @product)
  end

  def new
    @size = Size.new
    @product = Product.find(params[:id])
  end

  def create
    @size = Size.create(size_params)

    if @size
      flash[:success] = 'Success'
      redirect_to sizes_path(id: @size.product.id)
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def edit
    @size = Size.find(params[:id])
  end

  def update
    @size = Size.find(params[:id])

    if @size.update(size_params)
      flash[:success] = 'Success'
      redirect_to sizes_path(id: @size.product.id)
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    @size = Size.find(params[:id])
    if @size.destroy
      flash[:success] = 'Success'
      redirect_to sizes_path(id: @size.product.id)
    else
      flash[:error] = 'Error'
    end
  end

  private

  def size_params
    params.require(:size).permit(:size, :count_size, :product_id)
  end
end
