class DeleteTaxonConceptNames < ActiveRecord::Migration
  def self.up
    drop_table :taxon_concept_names
  end

  def self.down
    drop_table :taxon_concept_names
  end
end
