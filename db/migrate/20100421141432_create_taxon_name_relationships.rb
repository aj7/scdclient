class CreateTaxonNameRelationships < ActiveRecord::Migration
  def self.up
    create_table :taxon_name_relationships do |t|
      t.references :taxon_name
      t.references :name_relationship
      t.timestamps
    end
  end
  
  def self.down
    drop_table :taxon_name_relationships
  end
end
