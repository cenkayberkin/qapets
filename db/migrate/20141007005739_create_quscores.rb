class CreateQuscores < ActiveRecord::Migration
  def change
    create_table :quscores do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.integer :point
      t.timestamps
    end

  add_index :quscores, [ :user_id, :question_id ], :unique => true

  end
end
