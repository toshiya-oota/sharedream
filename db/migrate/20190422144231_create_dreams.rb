class CreateDreams < ActiveRecord::Migration[5.0]
  def change
    create_table :dreams do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :image
      t.boolean :release, default: false, null: false

      t.timestamps
    end
  end
end
