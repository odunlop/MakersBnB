require 'user'
require 'pg'
require_relative '../database_connection_setup'
require_relative './setup_test_database'

describe User do 
  before do
    setup_test_database
  end

  describe '.create' do 
    it 'creates a new user' do 
      user = User.create(email: 'test@example.com', password: 'password1')

      expect(user).to be_a User 
      expect(user.email).to eq 'test@example.com'
    end
    
    it 'the new user has a unique id' do 
      user = User.create(email: 'idtest@example.com', password: 'password1')
      connection = PG.connect(dbname: 'makersbnb_test')
      db_user = connection.exec("SELECT * FROM users WHERE email = 'idtest@example.com';")

      expect(user.id).to eq db_user[0]['id']
    end
  end

  describe '.authenticate' do 
    it 'returns a user given a correct username and password, if one exists' do 
      user = User.create(email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
    it 'finds a user ID' do
      user = User.create(email: 'test@example.com', password: 'password123')
 
      result = User.find(user.id)
      
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end
