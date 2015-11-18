class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone_number
      t.string :email_address
      t.string :address

      t.timestamps null: false
    end
  end
end
