class CreatePitcherListRankings < ActiveRecord::Migration
  def change

    create_table :ranking_lists do |t|

      t.string :url
      t.string :type

      t.timestamps null: false
    end

    create_table :ranking_list_players do |t|

      t.integer :ranking_list_id
      t.string  :name
      t.integer :current_rank
      t.integer :previous_rank
      t.integer :best_rank
      t.integer :worst_rank
      t.string  :positions
      t.string  :link

      t.timestamps null: false
    end

  end
end