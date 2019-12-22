class User < ApplicationRecord
  # model association
  has_many :orders, dependent: :destroy

  # validations
  validates_presence_of :name, message: 'não pode ser deixado em branco'
  validates_presence_of :cpf, message: 'não pode ser deixado em branco'

  validates_length_of :cpf, minimum: 11, maximum: 11, message: 'deve ter 11 dígitos'  
  
  validates_uniqueness_of :cpf, message: 'deve ser único'

  validates_numericality_of :cpf, message: 'deve conter apenas números'
end
