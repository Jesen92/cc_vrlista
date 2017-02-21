class AddJobDateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_date, :date
  end
end
