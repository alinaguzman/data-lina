class City < ApplicationRecord

  validates_presence_of :name, :date, :purpose

end
