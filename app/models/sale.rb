class Sale < ApplicationRecord

  validates_presence_of :date, :price, :earnings

end
