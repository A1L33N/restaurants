require 'rspec'
require 'pg'
require 'pry'
require 'food'

DB = PG.connect({:dbname => 'restaurant_test'})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE from food *;")
  end
end

describe Food do
  describe 'name' do
    it 'will return the name of the food' do
      wings = Food.new({:name => 'wings', :type  => 'American', :restaurant_id => 1})
      expect(wings.name).to eq('wings')
    end
  end

  describe '.==' do
    it("is the same food if it has the same name") do
      food1 = Food.new({:name => 'wings', :type  => 'American', :restaurant_id => 1})
      food2 = Food.new({:name => 'wings', :type  => 'American', :restaurant_id => 1})
      expect(food1).to eq(food2)
    end
  end

describe '.all' do
    it 'is an empty array at first' do
      expect(Food.all).to eq([])
    end
end

describe 'save' do
  it 'saves a food to an array of foods' do
    wings = Food.new({:name => 'wings', :type  => 'American', :restaurant_id => 1})
    wings.save
    expect(Food.all).to eq([wings])
  end
end

describe 'restaurant_id' do
  it 'returns the restaurant id of the food' do
    food1 = Food.new({:name => 'wings', :type  => 'American', :restaurant_id => 1})
    expect(food1.restaurant_id).to eq(1)
  end
end

end
