class CreateAnscores < ActiveRecord::Migration
  def change
    create_table :anscores do |t|
      t.belongs_to :user
      t.belongs_to :answer
      t.integer :point
      t.timestamps
  end
  add_index :anscores, [ :user_id, :answer_id ], :unique => true

  end
end
