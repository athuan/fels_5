class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.datetime :finished_at

      t.timestamps
    end
  end
end
