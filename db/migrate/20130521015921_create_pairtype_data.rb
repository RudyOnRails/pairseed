class CreatePairtypeData < ActiveRecord::Migration
  def up
    PairType.create(:name => "remote")
    PairType.create(:name => "in-person")
    PairType.create(:name => "either")
  end

  def down
    PairType.delete_all
  end
end
