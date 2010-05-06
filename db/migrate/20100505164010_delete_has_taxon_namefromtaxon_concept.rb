class DeleteHasTaxonNamefromtaxonConcept < ActiveRecord::Migration
  def self.up
    remove_column :taxon_concepts, :taxon_name_id
  end

  def self.down
    
  end
end
