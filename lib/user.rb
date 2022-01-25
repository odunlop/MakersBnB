require 'pg'
require 'bcrypt'

class User 
  attr_reader :email, :id

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    connection = PG.connect(dbname: 'makers_bnb_test')
    # the above will eventually be handled by a DatabaseConnection class which will know if test or not
    user = connection.exec_params(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;", [email, encrypted_password]
    )
    User.new(id: user[0]['id'], email: user[0]['email'])
  end

  def self.authenticate(email:, password:)
    connection = PG.connect(dbname: 'makers_bnb_test')
    result = connection.exec_params(
      "SELECT * FROM users WHERE email = $1;", [email]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end

  # eventually put in own class called DatabaseConnection which handles connecting to database