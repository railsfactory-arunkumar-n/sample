class StoreController < ApplicationController
  def index
    #@produts=Produts.all
    @products = Product.all
  end
  
end
