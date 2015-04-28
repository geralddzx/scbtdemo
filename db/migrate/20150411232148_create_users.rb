class CreateUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :username, :string, null: false
    add_column :users, :number, :string
    add_column :users, :role, :string, null: false

    add_column :users, :year, :integer
    add_column :users, :month, :integer
    add_column :users, :day, :integer

    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :phone, :string, limit: 10
    add_column :users, :referral, :string
    add_column :users, :photo_url, :string
  end
end
