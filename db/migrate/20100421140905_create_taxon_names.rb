class CreateTaxonNames < ActiveRecord::Migration
  def self.up
    create_table :taxon_names do |t|
      t.string :scientific_name
      t.string :basionym_authorship
      t.date :authorship_year
      t.integer :basionym_id
      t.boolean :is_usable
      t.date :alternative_authorship_year
      t.string :genus_part
      t.string :epithet
      t.string :infra_epithet
      t.timestamps
    end
  end
  
  def self.down
    drop_table :taxon_names
  end
end
