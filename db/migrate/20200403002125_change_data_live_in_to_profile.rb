class ChangeDataLiveInToProfile < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :live_in, :string
  end
end