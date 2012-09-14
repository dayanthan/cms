class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    t.references	:user
	t.integer		:sender_id
    t.integer		:receiver_id
	t.string		:subject
	t.binary		:description,	:limit => 10.megabyte
	t.integer		:read_status,	:default=>0
	t.timestamps
    end
  end
end
