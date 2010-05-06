class AddTaxonConceptToTaxonNames < ActiveRecord::Migration
  def self.up
    add_column :taxon_names, :taxon_concept_id, :integer
  end

  def self.down
    remove_column :taxon_names, :taxon_concept_id
  end
end
