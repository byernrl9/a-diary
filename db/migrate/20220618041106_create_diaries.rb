class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :title,        null: false
      t.text   :content,      null: false
      t.string :place,        null: false
      t.integer :weather,     null: false
      t.datetime :start_time, null: false
      t.references :user,     null: false, foreign_key
      t.references :album,    null: false, foreign_key
      t.timestamps
    end
  end
end
