class Address < ActiveRecord::Migration[6.1]
  def change
    create_table :address do |t|
      t.string :logradouro
      t.integer :numero
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :complemento
      
      t.timestamps
    end
  end
end
