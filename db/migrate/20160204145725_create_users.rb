class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.boolean :faculty, default: false
      t.string :email, null: false, default: ""
      t.string :password, null: false, default: ""
      t.string :username, null: false, default: ""

      t.timestamps null: false
    end
  end
end
