class CreateAspirations < ActiveRecord::Migration
  def change
    create_table :aspirations do |t|
      t.string :name

      t.timestamps

    end
  end
end
