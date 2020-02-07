class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.integer :rating
      t.string :streaming_service
      t.text :review
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
