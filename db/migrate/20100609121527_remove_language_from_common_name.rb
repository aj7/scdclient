class RemoveLanguageFromCommonName < ActiveRecord::Migration
  def self.up
    remove_column :common_names, :language
  end

  def self.down
     add_column :common_names, :language, :integer
  end
end
