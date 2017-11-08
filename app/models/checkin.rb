class Checkin < ApplicationRecord

  validates_presence_of :date, :category, :name

end
