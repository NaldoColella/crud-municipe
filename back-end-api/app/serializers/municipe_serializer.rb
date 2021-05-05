class MunicipeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :mail, :phone, :photo, :status, :dta_nasc
end
