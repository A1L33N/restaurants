class Restaurant
attr_reader :name, :type, :id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurants;")
    all_restaurants = []
    returned_restaurants.each() do |restaurant|
      new_restaurant = restaurants.fetch('name')
      restaurant_type = restaurants.fetch('type')
      restaurant_id = restaurants.fetch('id').to_i
      all_restaurants.push(Restaurant.new({:name => new_restaurant, :type => restaurant_type, :id => restaurant_id}))
    end
    all_restaurants
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO restaurants (name, type) VALUES ('#{@name}', '#{@type}') RETURNING id")
    @id = result.first.fetch('id').to_i
  end
end
