class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
       t.string :name
       t.string :image
       t.integer :like
       t.integer :dislike
      t.timestamps
    end
  end
end
