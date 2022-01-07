# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def catalog
    @products = Product.all.page(params[:page])

    if params[:search]
      search = params[:search]
      @products = @products.where('name like ?', "%#{search}%")
    end

    @products = @products.page params[:page]
  end
end
