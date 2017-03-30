class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string "name", limit: 30, null: false
    	t.string "email", limit: 50, null: false
    	t.string "password_digest", limit: 30, null: false
      t.timestamps
    end
  end
end
