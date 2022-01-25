require 'bcrypt'
require_relative 'database_connection'

class User 
  attr_reader :email, :id

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;", [email, encrypted_password]
    )
    User.new(id: user[0]['id'], email: user[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1;", [email]
    )
    return nil if result.ntuples.zero?
    decrypted_password = BCrypt::Password.new(result[0]['password'])
    if decrypted_password == password
      User.new(id: result[0]['id'], email: result[0]['email'])
    else
     nil
    end
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1;",
      [id]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

end
