class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :date
      t.string :time_of_day
      t.string :motivation_level
      t.string :rating_of_the_day
      t.integer :habit_id

      t.timestamps

    end
  end
end
