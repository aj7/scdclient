class AddRankIdToTaxonConcepts < ActiveRecord::Migration
  def self.up
    add_column :taxon_concepts, :rank_id, :integer
  end

  def self.down
    remove_column :taxon_concepts, :rank_id
  end
end
