require 'rails_helper'

RSpec.describe Wine, type: :model do
  let(:wine) { described_class.new(date: Date.today, grapes: 'Pinot Noir', rating: 3) }

  it 'is valid with valid attributes' do
    expect(wine).to be_valid
  end

  it 'is not valid without a date' do
    wine.date = nil
    expect(wine).to_not be_valid
  end

  it 'is not valid without a grapes' do
    wine.grapes = nil
    expect(wine).to_not be_valid
  end

  it 'is not valid without a rating' do
    wine.rating = nil
    expect(wine).to_not be_valid
  end

end
