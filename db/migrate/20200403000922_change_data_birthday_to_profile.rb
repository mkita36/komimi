class ChangeDataBirthdayToProfile < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :birthday, :date
  end
end
