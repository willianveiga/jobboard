class AddBriefDescriptionToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :brief_description, :string
  end
end
