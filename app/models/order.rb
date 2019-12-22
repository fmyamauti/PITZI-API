class Order < ApplicationRecord
  # model association
  belongs_to :user

  # validations
  validates_presence_of :device_model, message: 'não pode ser deixado em branco'
  validates_presence_of :imei, message: 'não pode ser deixado em branco'
  validates_presence_of :annual_price, message: 'não pode ser deixado em branco'

  validates_length_of :imei, minimum: 15, maximum: 15, message: 'deve ter 15 dígitos'

  validates_numericality_of :imei, message: 'deve conter apenas números'
  validates_numericality_of :installment_no, message: 'deve conter apenas números'
end
