class Habits < ActiveRecord::Migration
    def change
      create_table :habits do |t|
        t.string :title, null: false
        t.text :description, null: false
        t.integer :user_id, null: false
      end
      add_foreign_key :habits, :users
    end

end
