class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.boolean :has_options
      t.timestamps
    end
  end
end
