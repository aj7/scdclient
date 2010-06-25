class RenameCommentsonTaxonConcept < ActiveRecord::Migration
  def self.up
    rename_column :taxon_concepts, :comments, :external_comments
  end

  def self.down
    rename_column :taxon_concepts, :external_comments, :comments
  end
end
