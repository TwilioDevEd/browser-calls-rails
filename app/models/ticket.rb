class Ticket < ActiveRecord::Base
  validates :name, :phone_number, :description, presence: true
end
