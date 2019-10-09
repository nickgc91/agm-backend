class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :completion_status
      t.integer :user_id

      t.timestamps
    end
  end
end
