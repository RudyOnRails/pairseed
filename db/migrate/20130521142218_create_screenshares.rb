class CreateScreenshares < ActiveRecord::Migration
  def change
    create_table :screenshares do |t|

      t.timestamps
    end
  end
end
