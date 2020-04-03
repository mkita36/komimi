class RenameBirthYearColumnToProfile < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :birth_year, :birthday
  end
end
