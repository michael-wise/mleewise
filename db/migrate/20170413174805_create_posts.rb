class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :type
      t.boolean :visible

      t.timestamps
    end
  end
end
