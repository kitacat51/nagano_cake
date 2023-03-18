class Item < ApplicationRecord
    
    has_one_attached :image
    belong_to :cart_item
       
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
     image.variant(resize_to_limit: [100, 100]).processed
   end
   
   def with_tax_price
    (price * 1.1).floor
   end
    
end
