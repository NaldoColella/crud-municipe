class Municipe < ApplicationRecord
    has_one :address
    accepts_nested_attributes_for :address
    
    validates :cpf, length: { is: 11 } 
    validates :nome_completo, :cpf, :telefone, :foto, :status, :data_nascimento, presence: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :address, presence: true
    validates_associated :address
end
