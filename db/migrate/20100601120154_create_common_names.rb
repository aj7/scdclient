class CreateCommonNames < ActiveRecord::Migration
  def self.up
    create_table :common_names do |t|
      t.string :language
      t.string :name
      t.boolean :preferred, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :common_names
  end
end
