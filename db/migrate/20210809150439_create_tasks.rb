class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :pr
      t.float :houes
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
