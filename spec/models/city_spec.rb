require 'rails_helper'

RSpec.describe City, type: :model do

  let(:city) { described_class.new(name: 'West Hartford', date: Date.today, purpose: 'Vacation' ) }

  it 'is valid with valid attributes' do
    expect(city).to be_valid
  end

  it 'is not valid without a date' do
    city.date = nil
    expect(city).to_not be_valid
  end

  it 'is not valid without a name' do
    city.name = nil
    expect(city).to_not be_valid
  end

  it 'is not valid without a purpose' do
    city.purpose = nil
    expect(city).to_not be_valid
  end

end
