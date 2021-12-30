class ProductsController < ApplicationController
    def index
        @product = Product.all
    end
    def edit
        @product = Product.find(params[:id])
      end

      def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
          flash[:success] = 'Success'
          redirect_to products_path
        else
          flash[:error] = 'Error'
          render :edit
        end
      end
    
      def destroy
        @product = Product.find(params[:id])
    
        if @product.destroy
          flash[:success] = 'Success'
          redirect_to products_path
        else
          flash[:error] = 'Error'
        end
      end
    
      private
    
      def product_params
        params.require(:product).permit(:name,:description,:price,:product_type_id)
      end
    
end
