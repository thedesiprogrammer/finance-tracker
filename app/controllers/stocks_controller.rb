class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash[:danger]="You have entered an empty search"
      redirect_to my_portfolio_path
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger]="You have entered an incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
