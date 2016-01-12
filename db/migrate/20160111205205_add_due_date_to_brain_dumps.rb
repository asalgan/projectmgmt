class AddDueDateToBrainDumps < ActiveRecord::Migration
  def change
    add_column :brain_dumps, :due_date, :date
  end
end
