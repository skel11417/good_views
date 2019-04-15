class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :director
      t.string :poster
      t.string :actors
      t.imdb_id :string
      t.response :boolean
      t.timestamps
    end
  end
end
