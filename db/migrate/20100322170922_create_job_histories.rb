class CreateJobHistories < ActiveRecord::Migration
  def self.up
    create_table :job_histories do |t|
      t.references :user
      t.string :title
      t.string :company
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :job_histories
  end
end