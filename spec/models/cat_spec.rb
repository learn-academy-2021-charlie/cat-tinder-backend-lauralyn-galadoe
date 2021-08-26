require 'rails_helper'

RSpec.describe Cat, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

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
end
