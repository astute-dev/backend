class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
	  t.string :name, null: false
      t.string :location
      t.string :description
      t.string :department
      t.string :class 

      t.integer :user_id

      # times
      t.datetime :start_t
      t.datetime :end_t

      t.boolean :faculty, default: false

      t.timestamps null: false
    end
  end
end
