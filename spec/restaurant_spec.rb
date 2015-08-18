# require 'rspec'
# require 'pg'
# require 'pry'
# require 'food'
# require 'restaurant'
#
# DB = PG.connect({:dbname => 'restaurant_test'})
#
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE from restaurants *;")
#   end
# end
require 'spec_helper'

describe Restaurant do
  describe 'name' do
   it 'return the name of the restaurant' do
     new_restaurant = Restaurant.new({:name => 'Chipotle', :type => 'fast-casual', :id => 1})
     expect(new_restaurant.name).to eq('Chipotle')
   end
  end

  describe '.all' do
    it 'returns is an empty list at first' do
      expect(Restaurant.all).to eq([])
    end
  end

  describe 'save' do
    it 'saves a restaurant to the list of restaurants' do
      new_restaurant1 = Restaurant.new({:name => 'Chipotle', :type => 'fast-casual', :id => 1})
      new_restaurant1.save
      new_restaurant2 = Restaurant.new({:name => 'Pieology', :type => 'fast-casual', :id => 2})
      new_restaurant2.save
      expect(Restaurant.all).to eq([new_restaurant1, new_restaurant2])

    end
  end

  describe 'id' do
    it 'returns the id number of the restaurant' do
      new_restaurant1 = Restaurant.new({:name => 'Chipotle', :type => 'fast-casual', :id => 1})
      new_restaurant1.save
      expect(new_restaurant1.id).to eq(1)
    end
  end


end


# new_restaurant1 = Restaurant.new({:name => 'Chipotle', :type => 'fast-casual', :id => nil})
# new_restaurant2 = Restaurant.new({:name => 'Pieology', :type => 'fast-casual', :id => nil})
