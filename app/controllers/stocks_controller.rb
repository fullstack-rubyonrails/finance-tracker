class StocksController < ApplicationController
  
  def search
  # convert stock to @stock instance  variable  to access in my_portfolio page and display  stock details there.
    if params[:stock].present?  
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js {
            render partial: 'users/result'
          }
        end
        # render 'users/my_portfolio' (Remove this because "respond_to" added above)
      else
        # Here for-invalid & empty stock symbol we are using same format as in IF (valid symbol) block
        respond_to  do |format|
          # to remove flash persistence will  falsh.now
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js {
            render partial: 'users/result'
          }
        end
      end
    else
      respond_to  do |format|
        # to remove flash persistence will  falsh.now
        flash.now[:alert] = "Please enter any symbol to search"
        format.js {
          render partial: 'users/result'
        }
      end
    end
  end
end