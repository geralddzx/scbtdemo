class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
    	t.string :url, null: false
    	t.string :mimetype
      t.string :filename, null: false
    	t.integer :uploader_id
      t.integer :size
    	t.integer :source_id
      t.string  :source_type
    	t.timestamps null: false
    end
  end
end
