class AddDeletedByToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :deleted_by, :integer
  end

  def self.down
    remove_column :comments, :deleted_by
  end
end
