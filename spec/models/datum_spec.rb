require 'rails_helper'

RSpec.describe Datum, type: :model do
  let(:datum) { described_class.new(date: Date.today, klass: 'Run', foreign_id: 1) }

  it 'is valid with valid attributes' do
    expect(datum).to be_valid
  end

  it 'is not valid without a date' do
    datum.date = nil
    expect(datum).to_not be_valid
  end

  it 'is not valid without a klass' do
    datum.klass = nil
    expect(datum).to_not be_valid
  end

  it 'is not valid without a foreign_id' do
    datum.foreign_id = nil
    expect(datum).to_not be_valid
  end

end
