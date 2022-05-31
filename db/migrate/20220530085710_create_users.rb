class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :remember_digest
      t.boolean :gender
      t.integer :role
      t.boolean :is_active
      t.string :activation_digest
      t.string :reset_digest
      t.string :avatar

      t.timestamps
    end
  end
end
