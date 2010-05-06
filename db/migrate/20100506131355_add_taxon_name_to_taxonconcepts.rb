class AddTaxonNameToTaxonconcepts < ActiveRecord::Migration
  def self.up
    add_column :taxon_concepts, :taxon_name_id, :integer
  end

  def self.down
    remove_column :taxon_concepts, :taxon_name_id
  end
end
