class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :project_id
      t.time :hours
      t.text :description

      t.timestamps null: false
    end
  end
end
