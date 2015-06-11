class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :listing_id
      t.string :picture_url

      t.timestamps

    end
  end
end
