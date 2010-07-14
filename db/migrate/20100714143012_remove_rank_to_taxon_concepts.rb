class RemoveRankToTaxonConcepts < ActiveRecord::Migration
  def self.up
    remove_column :taxon_concepts, :rank
  end

  def self.down
     add_column :taxon_concepts, :rank, :string
  end
end
