class ApplicationController < ActionController::Base
  
  before_filter :authorize
  protect_from_forgery
 private
  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  
 protected
    def authorize
      unless User.find_by_id( session[:user_id] )
      redirect_to login_url, :notice => "Please log in"
    end
    end
    def user_authorize

      find=User.find_by_id( session[:user_id] )
      p find.role
      if(find.role)
           redirect_to products_url
      else
            
            redirect_to store_path
      end  
    end
end
