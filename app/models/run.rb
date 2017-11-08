class Run < ApplicationRecord

  validates_presence_of :date, :miles, :finish, :name

end
