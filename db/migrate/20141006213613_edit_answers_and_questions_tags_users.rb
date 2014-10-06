class EditAnswersAndQuestionsTagsUsers < ActiveRecord::Migration

  def change
    change_table :questions do |t|
      t.string :title
      t.string :content
      t.belongs_to :user
    end

    change_table :answers do |t|
      t.string :content
      t.belongs_to :user
      t.belongs_to :question
    end

    change_table :tags do |t|
      t.string :name
    end

    create_table :questions_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :question
    end

    add_index :tags, :name,unique: true

  end
end
