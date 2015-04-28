class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title, null: false
    	t.datetime :datetime
    	t.string :location
    	t.text :content
    	t.integer :author_id
      t.boolean :display, null: false, default: true
			t.timestamps
    end
  end
end
