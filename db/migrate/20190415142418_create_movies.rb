class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :director
      t.string :poster
      t.string :actors
      t.string :imdb_id
      t.boolean :response
      t.timestamps
    end
  end
end
