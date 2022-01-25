require 'database_connection'

describe DatabaseConnection do 
  describe '.setup' do 
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

      DatabaseConnection.setup
    end
  end

  describe '.query' do 
    it 'can send over an SQL query' do 
      connection = DatabaseConnection.setup
      connection.exec("INSERT INTO users (email, password) values ('test@example.com', 'password123');")

      result = DatabaseConnection.query("SELECT * FROM users WHERE email = 'test@example.com';")

      expect(result[0]['email']).to eq "test@example.com"
    end
  end
end