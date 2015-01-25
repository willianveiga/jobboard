class AddBriefDescriptionToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :brief_description, :string
  end
end
