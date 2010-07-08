class RenameOrderingInRanks < ActiveRecord::Migration
  def self.up
   change_column :ranks, :ordering, :string
  end

  def self.down
    change_column :ranks, :ordering, :integer
  end
end
