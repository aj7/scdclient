class CreateTaxonConceptNames < ActiveRecord::Migration
  def self.up
    create_table :taxon_concept_names do |t|
      t.integer :taxon_concept_id
      t.integer :taxon_names_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :taxon_concept_names
  end
end
