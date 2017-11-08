class CreateDatum

  attr_accessor :entry

  def initialize(entry)
    @entry = entry
  end

  def execute
    datum = Datum.create(klass: entry.class.name, foreign_id: entry.id, date: entry.date)
    unless datum.valid?
      puts "*** Entry datum callback failed: #{entry.inspect}"
    end
  end

end