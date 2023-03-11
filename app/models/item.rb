class Item < ApplicationRecord
   belongs_to :genre
   has_one_attached :image
   
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     image.variant(resize_to_limit: [100, 100]).processed
   end
end
