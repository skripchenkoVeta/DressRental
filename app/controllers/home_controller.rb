# frozen_string_literal: true

class HomeController < ApplicationController
  NUMBER_ITEMS_PER_PAGE = 16
  def index; end

  def catalog_salons
    @salons = Salon.all
    
    if params[:search]
      search = params[:search]
      @salons = @salons.where('name like ?', "%#{search}%")
    end

    @salons = @salons.includes(:picture_attachment).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
  end

  def catalog
    @products = Product.all

    if params[:search]
      search = params[:search]
      @products = @products.where('name like ?', "%#{search}%")
    end

    @products = @products.includes(:avatar_attachment).page(params[:page]).per(NUMBER_ITEMS_PER_PAGE)
  end
end
