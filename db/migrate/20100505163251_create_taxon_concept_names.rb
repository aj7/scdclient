class CreateTaxonConceptNames < ActiveRecord::Migration
  def self.up
    create_table :taxon_concept_names do |t|
      t.taxon_concept :references
      t.taxon_name :references
      t.timestamps
    end
  end
  
  def self.down
    drop_table :taxon_concept_names
  end
end
