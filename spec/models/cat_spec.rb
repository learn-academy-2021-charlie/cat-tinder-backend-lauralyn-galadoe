require 'rails_helper'

RSpec.describe Cat, type: :model do

  it 'should have a name' do
    cat = Cat.create(age: 2, enjoys: 'belly rubs and cuddle')
    expect(cat.errors[:name]).to_not be_empty
  end

  it 'should have an age' do
    cat = Cat.create(name: 'Boo', enjoys: 'belly rubs and cuddle')
    expect(cat.errors[:age]).to_not be_empty
  end

  it 'should have enjoy' do
    cat = Cat.create(age: 2, name: 'Boo')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it 'not valid if enjoy less than 10' do
    cat = Cat.create(age: 2, name: 'Boo', enjoys: 'nothing')
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
