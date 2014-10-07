class AddScoreToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :point, default: 0
    end
  end
end
