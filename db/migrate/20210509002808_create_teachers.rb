class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :nome
      t.boolean :status
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
