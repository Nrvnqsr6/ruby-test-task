class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.text :full_name
      t.date :birth_date
      t.text :phone_number
      t.text :email
    end
    add_index :patients, :phone_number, unique: true
  end
end
