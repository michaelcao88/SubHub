class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.date :start_date
      t.text :description
      t.integer :rent
      t.string :title
      t.date :end_date
      t.string :address
      t.integer :user_id

      t.timestamps

    end
  end
end
