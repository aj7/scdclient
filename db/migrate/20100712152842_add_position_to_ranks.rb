class AddPositionToRanks < ActiveRecord::Migration
  def self.up
    add_column :ranks, :position, :integer

    ranks = Rank.all

    ranks.each_with_index do |r, i|
      r.position = i+1
      r.save!
    end

  end

  def self.down
    remove_column :ranks, :position
  end
end
