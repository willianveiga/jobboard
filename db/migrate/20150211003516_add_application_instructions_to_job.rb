class AddApplicationInstructionsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :application_instructions, :string
  end
end
