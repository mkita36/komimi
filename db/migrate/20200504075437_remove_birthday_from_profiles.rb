class RemoveBirthdayFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :birthday, :integer
  end
end
