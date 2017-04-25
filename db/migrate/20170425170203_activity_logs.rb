class ActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.string :daily_comment, null: false
      t.date :date, null: false
      t.boolean :completed, null: false
      t.integer :habit_id, null: false
    end
    add_foreign_key :activity_logs, :habits
  end
end
