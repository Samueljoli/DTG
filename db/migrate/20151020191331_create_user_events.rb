class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.integer :shown_user_id
      t.string :liked

      t.timestamps null: false
    end
    add_foreign_key :user_events, :users
    add_foreign_key :user_events, :events
  end
end
