module CurrentConsidered
  extend ActiveSupport::Concern

  private

  def set_cart
    @con_cart = ConsiderCart.find(session[:con_cart_id])
  rescue ActiveRecord::RecordNotFound
    @con_cart = ConsiderCart.create
    session[:con_cart_id] = @con_cart.id
  end
end