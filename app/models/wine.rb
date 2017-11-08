class Wine < ApplicationRecord

  validates_presence_of :date, :grapes, :rating

end
