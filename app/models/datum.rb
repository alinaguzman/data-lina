class Datum < ApplicationRecord

  validates :klass, :date, :foreign_id, presence: true

  def self.find_entry(entry)
    where(klass: entry.class.name, foreign_id: entry.id).try(:first)
  end

  def link
    "/data/#{klass.downcase.pluralize}/#{foreign_id}"
  end

end
