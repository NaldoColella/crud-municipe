class MunicipeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :mail, :phone, :photo, :status, :dta_nasc, :address

  has_one :address

  def address
    return unless object.address
    {
      id: object.address.id,
      cep: object.address.cep,
      logradouro: object.address.logradouro,
      complemento: object.address.complemento,
      bairro: object.address.bairro,
      cidade: object.address.cidade,
      uf: object.address.uf,
      ibge: object.address.ibge
    }
  end
end
