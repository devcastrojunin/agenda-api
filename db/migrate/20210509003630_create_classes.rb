class CreateClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :classes do |t|
      t.string :nome
      t.boolean :status
      t.references :matter, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
