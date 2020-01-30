class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/result' }
      end
    end
  end

  def quick_search
    if params[:stock].present?
      @quick_search = Stock.new_lookup(params[:stock])
      if @quick_search
        render 'users/quick_search'
      else
        flash.now[:alert] = "Please enter a valid symbol to search"
        render 'users/quick_search'
      end
    else
      flash.now[:alert] = "Please enter a symbol to search"
      render 'users/quick_search'
    end
  end
end
