class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep, limit: 11
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf, limit: 2
      t.integer :ibge
      t.references :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
