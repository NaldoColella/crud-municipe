class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :municipes, :full_name, :nome_completo
    rename_column :municipes, :mail, :email
    rename_column :municipes, :phone, :telefone
    rename_column :municipes, :photo, :foto 
  end
end
