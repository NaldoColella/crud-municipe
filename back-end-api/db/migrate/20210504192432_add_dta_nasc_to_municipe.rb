class AddDtaNascToMunicipe < ActiveRecord::Migration[6.1]
  def change
    add_column :municipes, :dta_nasc, :date
  end
end
