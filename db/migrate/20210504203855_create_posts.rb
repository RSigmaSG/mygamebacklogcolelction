class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :thoughts
      t.belongs_to :play
      t.integer :current_playtime
      
      t.timestamps
    end
  end
end
