class Item < ApplicationRecord

	validates :title,
  	presence: true,
  	length: { minimum: 3, maximum: 140 }

  	validates :description,
  	presence: true,
  	length: { minimum: 5, maximum: 300 }

	validates :price, presence: true

	validates :img_url, presence: true

end
