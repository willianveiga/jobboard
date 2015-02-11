class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :companies
  end
end
