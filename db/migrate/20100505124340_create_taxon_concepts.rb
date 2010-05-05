class CreateTaxonConcepts < ActiveRecord::Migration
  def self.up
    create_table :taxon_concepts do |t|
      t.text :comments
      t.references :taxon_name
      t.string :has_taxon_status
      t.string :rank
      t.boolean :is_current
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
  end
  
  def self.down
    drop_table :taxon_concepts
  end
end
