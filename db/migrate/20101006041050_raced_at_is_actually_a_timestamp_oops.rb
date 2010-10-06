class RacedAtIsActuallyATimestampOops < ActiveRecord::Migration
  def self.up
		remove_column :entries, :raced_at
		add_column :entries, :raced_at, :timestamp
  end

  def self.down
  end
end
