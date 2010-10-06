class AddCarDetailsToEntries < ActiveRecord::Migration
  def self.up
		add_column :entries, :model, :string
		add_column :entries, :car_year, :string
		add_column :entries, :description, :text
  end

  def self.down
  end
end
