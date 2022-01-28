require_relative 'database_connection' 

class Space
  attr_reader :id, :name, :description, :price, :creator

  def initialize(id:, name:, description:, price:, creator:)
    @id = id
    @name = name
    @description = description
    @price = price
    @creator = creator
  end

  def self.all
    result = DatabaseConnection.query("SELECT * from spaces")
    result.map do |space|
      self.wrap(space)
    end
  end

  def self.create(name:, description:, price:, creator:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, creator)
      VALUES($1, $2, $3, $4)
      RETURNING id, name, description, price, creator;", [name, description, price, creator]
    ) 
  end

  def self.mine(user_id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE creator = $1", [user_id])
    result.map do |space|
      self.wrap(space)
    end
  end

  def self.find(space_id)
    space = DatabaseConnection.query("SELECT * FROM spaces WHERE id = $1", [space_id])
    self.wrap(space[0])
  end
  
  private

  def self.wrap(space)
    Space.new(
      id: space['id'],
      name: space['name'],
      description: space['description'],
      price: space['price'],
      creator: space['creator'])
  end
end 