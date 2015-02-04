class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :brief_description
      t.text :description
      t.string :website
      t.boolean :active

      t.timestamps null: false
    end
  end
end
