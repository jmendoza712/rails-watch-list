class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.string :overview
      t.decimal :rating, precision: 2, scale: 1

      t.timestamps
    end
  end
end
