class CreatePairPlaces < ActiveRecord::Migration
  def change
    create_table :pair_places do |t|
      t.string :nickname
      t.string :street
      t.string :city
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
