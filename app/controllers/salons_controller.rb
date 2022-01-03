class SalonsController < ApplicationController
    def index
        @salon = Salon.all
    end
    def edit
        @salon = Salon.find(params[:id])
      end

      def update
        @salon = Salon.find(params[:id])
    
        if @salon.update(salon_params)
          flash[:success] = 'Success'
          redirect_to salons_path
        else
          flash[:error] = 'Error'
          render :edit
        end
      end
    
      def destroy
        @salon = Salon.find(params[:id])
    
        if @salon.destroy
          flash[:success] = 'Success'
          redirect_to salons_path
        else
          flash[:error] = 'Error'
        end
      end
    
      private
    
      def salon_params
        params.require(:salon).permit(:name,:address)
      end
    
end
