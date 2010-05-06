class DeleteTaxonConceptfromTaxonName < ActiveRecord::Migration
  def self.up
    remove_column :taxon_names, :taxon_concept_id
  end

  def self.down
  end
end
