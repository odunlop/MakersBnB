require 'user'

describe User do 

  describe '.create' do 
    it 'creates a new user' do 
      user = User.create(email: 'test@example.com', password: 'password1')

      expect(user).to be_a User 
      expect(user.email).to eq 'test@example.com'
      expect(user.password).to eq 'password1'
    end
  end
end