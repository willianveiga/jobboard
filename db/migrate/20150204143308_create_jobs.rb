class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :brief_description
      t.text :description
      t.boolean :active
      t.integer :company_id
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :jobs, :companies
  end
end
