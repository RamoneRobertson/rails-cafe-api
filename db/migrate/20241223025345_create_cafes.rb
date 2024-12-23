class CreateCafes < ActiveRecord::Migration[8.0]
  def change
    create_table :cafes do |t|
      t.string :title
      t.string :address
      t.string :picture
      t.jsonb :hours
      t.string :criteria

      t.timestamps
    end
  end
end
