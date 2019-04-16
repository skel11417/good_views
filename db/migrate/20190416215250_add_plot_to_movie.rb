class AddPlotToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :plot, :string
  end
end
