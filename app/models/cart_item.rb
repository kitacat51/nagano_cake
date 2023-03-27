class CartItem < ApplicationRecord
    has_one_attached :image
    belongs_to :item
    belongs_to :customer
    belongs_to :order
    
    def subtotal
      item.with_tax_price * amount
    end
end
