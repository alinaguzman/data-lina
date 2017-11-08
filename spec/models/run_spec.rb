require 'rails_helper'

RSpec.describe Run, type: :model do
  let(:run) { described_class.new(date: Date.today, name: 'NYC Marathon', miles: 26.2, finish: '6:06:20') }

  it 'is valid with valid attributes' do
    expect(run).to be_valid
  end

  it 'is not valid without a date' do
    run.date = nil
    expect(run).to_not be_valid
  end

  it 'is not valid without a name' do
    run.name = nil
    expect(run).to_not be_valid
  end

  it 'is not valid without miles' do
    run.miles = nil
    expect(run).to_not be_valid
  end

  it 'is not valid without finish time' do
    run.finish = nil
    expect(run).to_not be_valid
  end

end
