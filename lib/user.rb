class User 
  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    User.new(email: email, password: password)
    # user = DatabaseConnection.query(
    #   "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;", [email, password]
    # )
    # User.new(id: user[0]['id'], email: user[0]['email'], password: user[0]['password'])
  end
end

  # eventually put in own class called DatabaseConnection which handles connecting to database