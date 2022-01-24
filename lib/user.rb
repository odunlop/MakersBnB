require 'pg'

class User 
  attr_reader :email, :id

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    connection = PG.connect(dbname: 'makersbnb')
    user = connection.exec_params(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;", [email, password]
    )
    User.new(id: user[0]['id'], email: user[0]['email'])
  end
end

  # eventually put in own class called DatabaseConnection which handles connecting to database