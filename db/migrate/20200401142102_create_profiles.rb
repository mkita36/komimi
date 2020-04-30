class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :self_introduction
      t.date :birth_year
      t.text :live_in

      t.timestamps
    end
  end
end
