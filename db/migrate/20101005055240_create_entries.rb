class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|

			t.integer :user_id
			t.integer :approver_id
			
			t.string :tb_class
			t.string :category
			
			t.float		:rt
			t.float		:sixty
			t.float		:eighth
			t.float		:eighth_trap
			t.float		:thousand_foot
			t.float		:et
			t.float		:trap
			
			t.boolean	:nitrous, :default => false
			
			t.string	:raced_at
			
			t.string	:timeslip_url
			t.string	:photo_url

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
