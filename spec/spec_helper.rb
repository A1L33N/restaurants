require 'rspec'
require 'pg'
require 'pry'
require 'food'
require 'restaurant'

DB = PG.connect({:dbname => 'restaurant_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE from restaurants *;")
    DB.exec("DELETE from food *;")
  end
end
