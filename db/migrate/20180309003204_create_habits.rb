class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.integer :user_id
      t.integer :aspiration_id
      t.string :name
      t.string :goal
      t.integer :days_per_week

      t.timestamps

    end
  end
end
