class CreatePairTypes < ActiveRecord::Migration
  def change
    create_table :pair_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
