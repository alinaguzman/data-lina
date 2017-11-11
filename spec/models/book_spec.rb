require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:book) { described_class.new(name: 'Harry Potter', author: 'JK Rowling', format: 'Audible', date: Date.today ) }

  it 'is valid with valid attributes' do
    expect(book).to be_valid
  end

  it 'is not valid without a date' do
    book.date = nil
    expect(book).to_not be_valid
  end

  it 'is not valid without a name' do
    book.name = nil
    expect(book).to_not be_valid
  end

  it 'is not valid without an author' do
    book.author = nil
    expect(book).to_not be_valid
  end

  it 'is not valid without a format' do
    book.format = nil
    expect(book).to_not be_valid
  end

end
