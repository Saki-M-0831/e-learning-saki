class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :action_id
      t.string :action_type

      t.timestamps
    end
  end
end
