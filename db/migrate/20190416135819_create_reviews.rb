class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :content
      t.integer :rating
      t.integer :rank

      t.timestamps
    end
  end
end
