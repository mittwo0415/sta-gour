class CreateBallParks < ActiveRecord::Migration[6.1]
  def change
    create_table :ball_parks do |t|
      t.string :name

      t.timestamps
    end
  end
end
