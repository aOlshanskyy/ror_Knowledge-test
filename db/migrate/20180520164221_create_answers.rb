class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :test_id
      t.string :version
      t.string :value

      t.timestamps
    end
  end
end
