require 'user'
require 'pg'

describe User do 

  describe '.create' do 
    it 'creates a new user' do 
      user = User.create(email: 'test@example.com', password: 'password1')
      connection = PG.connect(dbname: 'makers_bnb_test')

      expect(user).to be_a User 
      expect(user.email).to eq 'test@example.com'

      connection.exec("TRUNCATE users;")
    end
    
    it 'the new user has a unique id' do 
      user = User.create(email: 'idtest@example.com', password: 'password1')
      connection = PG.connect(dbname: 'makers_bnb_test')
      db_user = connection.exec("SELECT * FROM users WHERE email = 'idtest@example.com';")

      expect(user.id).to eq db_user[0]['id']

      connection.exec("TRUNCATE users;")
    end
  end

  describe '.authenticate' do 
    it 'returns a user given a correct username and password, if one exists' do 
      user = User.create(email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id

      connection = PG.connect(dbname: 'makers_bnb_test')
      connection.exec("TRUNCATE users;")
    end
  end
end