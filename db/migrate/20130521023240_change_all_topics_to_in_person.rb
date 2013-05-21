class ChangeAllTopicsToInPerson < ActiveRecord::Migration
  def up
    @in_person = PairType.find_by_name("in-person")
    Topic.all.each do |topic|
      topic.update_attribute(:pair_type_id, @in_person.id)
    end
  end

  def down
    Topic.update_all(:pair_type_id => nil)
  end
end
