class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
      t.integer :set
      t.integer :repetition
      t.decimal :weight

      t.timestamps
    end
  end
end
