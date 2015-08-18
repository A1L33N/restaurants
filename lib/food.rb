class Food
  attr_reader(:name, :type, :restaurant_id)

  define_method(:initialize) do |attributes|
   @name = attributes.fetch(:name)
   @type = attributes.fetch(:type)
   @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_method(:==) do |another_food|
    (self.name).==(another_food.name) && (self.type).==(another_food.type) && (self.restaurant_id).==(another_food.restaurant_id)
  end

  define_singleton_method(:all) do
    returned_food = DB.exec("SELECT * FROM  food;")
    all_foods = []
    returned_food.each() do |food|
      food_name = food.fetch('name')
      food_type = food.fetch('type')
      restaurant_id = food.fetch('restaurant_id').to_i
      all_foods.push(Food.new({:name => food_name, :type => food_type, :restaurant_id => restaurant_id}))
    end
    all_foods
  end

  define_method(:save) do
    DB.exec("INSERT INTO food (name, type, restaurant_id) VALUES ('#{@name}', '#{@type}', #{@restaurant_id});")
  end

end
