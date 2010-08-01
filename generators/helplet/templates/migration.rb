class CreateHelps < ActiveRecord::Migration
  def self.up
    create_table :helps do |t|
      t.column :key, :string
      t.column :title, :string
      t.column :description, :text
    end

    add_index :helps, :key
  end

  def self.down
    drop_table :helps

    remove_index :helps, :key
  end
end
