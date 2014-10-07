class CreateAnscores < ActiveRecord::Migration
  def change
    create_table :anscores do |t|
      t.belongs_to :user
      t.belongs_to :answer
      t.integer :point
      t.timestamps
    end
  end
end
