class Address < ApplicationRecord
  belongs_to :municipe
  validates :cep, :logradouro, :bairro, :cidade, presence: true
  validates :uf , length: { is: 2 }, presence: true
  #:complemento
  #:ibge
end
