require 'rails_helper'

RSpec.describe Checkin, type: :model do
  let(:checkin) { described_class.new(date: Date.today, name: 'Bay Ridge', category: 'Neighborhood') }

  it 'is valid with valid attributes' do
    expect(checkin).to be_valid
  end

  it 'is not valid without a date' do
    checkin.date = nil
    expect(checkin).to_not be_valid
  end

  it 'is not valid without a name' do
    checkin.name = nil
    expect(checkin).to_not be_valid
  end

  it 'is not valid without a category' do
    checkin.category = nil
    expect(checkin).to_not be_valid
  end

end
