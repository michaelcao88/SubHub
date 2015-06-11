class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :gender
      t.text :description
      t.string :email
      t.string :facebook
      t.string :linkedin
      t.date :birth_date
      t.string :college
      t.string :phone_number

      t.timestamps

    end
  end
end
