class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.belongs_to :game
      t.belongs_to :user
      t.boolean :completed, default:false

      t.timestamps
    end
  end
end
