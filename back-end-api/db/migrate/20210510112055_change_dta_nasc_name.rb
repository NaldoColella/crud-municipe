class ChangeDtaNascName < ActiveRecord::Migration[6.1]
  def change
    rename_column :municipes, :dta_nasc, :data_nascimento
  end
end
