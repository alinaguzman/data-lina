require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:sale) { described_class.new(date: Date.today, price: 75, earnings: 60) }

  it 'is valid with valid attributes' do
    expect(sale).to be_valid
  end

  it 'is not valid without a date' do
    sale.date = nil
    expect(sale).to_not be_valid
  end

  it 'is not valid without a price' do
    sale.price = nil
    expect(sale).to_not be_valid
  end

  it 'is not valid without earnings' do
    sale.earnings = nil
    expect(sale).to_not be_valid
  end
end
