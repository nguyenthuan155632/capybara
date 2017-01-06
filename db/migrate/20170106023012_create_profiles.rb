class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :email
      t.datetime :birthdate
      t.boolean :is_male
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
