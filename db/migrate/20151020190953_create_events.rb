class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.integer :street_number
			t.string :street_name
			t.string :city
      t.string :state
      t.integer :zip
      t.text :description
			t.string :cost
			t.string :tickets
      t.string :url
      t.string :image
      t.string :category
			t.date :date
			t.string :time

      t.timestamps null: false
    end
  end
end
