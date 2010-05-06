class ChangeTypeofTaxonConcept < ActiveRecord::Migration
  def self.up
    change_column :taxon_concepts, :is_current, :boolean, :default => false
  end


  def self.down
    drop_table :taxon_concepts
  end
end
