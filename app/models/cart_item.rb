class CartItem < ApplicationRecord
    has_one_attached :image
    has_many :items
    def subtotal
      item.with_tax_price * amount
    end
end
