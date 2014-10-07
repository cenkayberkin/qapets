class CreateQuscores < ActiveRecord::Migration
  def change
    create_table :quscores, id: false do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.integer :point
      t.timestamps
    end
  end
end
