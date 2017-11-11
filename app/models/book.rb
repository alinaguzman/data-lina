class Book < ApplicationRecord

  validates_presence_of :name, :author, :format, :date
end
