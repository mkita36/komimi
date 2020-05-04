class AddBirthdayToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :birthday, :date
  end
end
