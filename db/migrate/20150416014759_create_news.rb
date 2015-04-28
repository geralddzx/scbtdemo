class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.string :title, null: false
    	t.datetime :datetime
    	t.string :description
    	t.text :content
    	t.integer :author_id
			t.timestamps
    end
  end
end
