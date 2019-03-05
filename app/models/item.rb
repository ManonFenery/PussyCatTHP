class Item < ApplicationRecord
	has_many :line_items, dependent: :destroy

	validates :title,
  	presence: true,
  	length: { minimum: 3, maximum: 140 }

  	validates :description,
  	presence: true,
  	length: { minimum: 5, maximum: 300 }

	validates :price, presence: true

	validates :img_url, presence: true

end
