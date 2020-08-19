class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :image
      t.string :borough
      t.string :detail

      t.timestamps
    end
  end
end
