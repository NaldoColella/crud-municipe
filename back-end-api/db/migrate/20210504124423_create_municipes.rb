class CreateMunicipes < ActiveRecord::Migration[6.1]
  def change
    create_table :municipes do |t|
      t.string :full_name
      t.string :cpf, limit: 11
      t.string :mail
      t.string :phone
      t.binary :photo
      t.boolean :status

      t.timestamps
    end
  end
end
