class CreateActionItems < ActiveRecord::Migration[6.0]
  def change
    create_table :action_items do |t|
      t.string :action
      t.boolean :isCompleted
      t.integer :goal_id

      t.timestamps
    end
  end
end
