class CreateAccomplishments < ActiveRecord::Migration
  def change
    create_table :accomplishments do |t|
      t.integer :log_id
      t.string :milestone
      t.string :image_url

      t.timestamps

    end
  end
end
