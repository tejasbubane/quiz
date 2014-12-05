class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :option
      t.string :text, null: false
      t.boolean :correctness, default: false
      t.references :question
      t.timestamps
    end
  end
end
