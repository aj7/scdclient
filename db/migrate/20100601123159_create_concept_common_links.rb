class CreateConceptCommonLinks < ActiveRecord::Migration
  def self.up
    create_table :concept_common_links do |t|
      t.integer :taxon_concept_id
      t.integer :common_name_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :concept_common_links
  end
end
