class AddJobtoComment < ActiveRecord::Migration
  def change
    add_column :comments, :job_id, :integer
    add_index :comments, :job_id
  end
end
