class Ticket < ApplicationRecord
  validates :name, :phone_number, :description, presence: true
end
