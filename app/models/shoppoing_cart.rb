class ShoppoingCart < ApplicationRecord
  acts_as_shopping_cart
  
  scope :set_user_cart, -> (user) { user_cart = where(user_id: user.id, buy_flag: false)&.last
                              user_cart.nill? ? ShoppoingCart.create(user_id: user.id)
                                              : user_cart }
  
  def tax_pct
    0
  end
end
