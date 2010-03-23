class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.date :birth_date
      t.string :location
      t.string :state
      t.string :activation_code
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
