class CreateJournalings < ActiveRecord::Migration[6.0]
  def change
    create_table :journalings do |t|
      t.string :title
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
