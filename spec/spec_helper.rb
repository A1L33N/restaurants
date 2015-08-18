require 'rspec'
require 'PG'
require 'pry'
require 'food'
require 'restaurant'

DB = PG.connect({:dbname => 'restaurant_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurants *;")
    DB.exec("DELETE FROM food *;")
  end
end
