class CreateLifeStatusTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :life_status_trackers do |t|
      t.integer :finances
      t.integer :dating
      t.integer :social
      t.integer :spiritual
      t.integer :health
      t.integer :user_id

      t.timestamps
    end
  end
end
