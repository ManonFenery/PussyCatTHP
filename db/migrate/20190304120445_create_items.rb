class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :title
    	t.text :description
    	t.decimal :price
    	t.string :img_url
      t.timestamps
    end
  end
end
