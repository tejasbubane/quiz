class CreateUserAttempts < ActiveRecord::Migration
  def change
    create_table :user_attempts do |t|
      t.references :user
      t.references :question
      t.string :answers, array: true
      t.timestamps
    end
  end
end
