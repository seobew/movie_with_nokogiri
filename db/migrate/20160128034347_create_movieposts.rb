class CreateMovieposts < ActiveRecord::Migration
  def change
    create_table :movieposts do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
