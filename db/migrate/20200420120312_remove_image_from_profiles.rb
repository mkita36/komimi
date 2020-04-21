class RemoveImageFromProfiles < ActiveRecord::Migration[6.0]
  def change

    remove_column :profiles, :image, :string
  end
end
