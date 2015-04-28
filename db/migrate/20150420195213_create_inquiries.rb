class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
    	t.string :email
    	t.string :name
    	t.string :phone
 		t.string :subject
 		t.string :ip_address
 		t.boolean :read, default: false
  		t.string :http_user_agent
  		t.integer :campus_id
  		t.integer :program_id
  		t.string :referral
    	t.timestamps null: false
    end
  end
end
