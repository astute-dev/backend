class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
	    t.string :name, null: false
      t.string :location
      t.string :description
      t.string :department
      t.string :course
      t.string :members_attending

      t.integer :user_id
      t.integer :number_attending

      # times
      t.datetime :start_t
      t.datetime :end_t

      t.boolean :faculty, default: false

      t.timestamps null: false
    end
  end
end
