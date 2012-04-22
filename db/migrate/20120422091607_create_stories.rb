class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.text :description

      t.integer :owner_id
      t.integer :requester_id

      t.string :type

      t.string_array :labels
      t.integer_array :seen_by

      t.timestamps
    end
  end
end
