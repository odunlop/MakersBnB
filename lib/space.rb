require_relative 'database_connection' 

class Space

  def self.create(name:, description:, price:, creator:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, creator)
      VALUES($1, $2, $3, $4)
      RETURNING id, name, description, price, creator;", [name, description, price, creator]
    ) 
  end
end 
