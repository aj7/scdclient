class AddUserToLanguage < ActiveRecord::Migration
  def self.up
    add_column :languages, :user_id, :integer
  end

  def self.down
    remove_column :languages, :user_id
  end
end
