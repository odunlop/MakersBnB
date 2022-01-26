require 'space'

describe Space do 
  describe '.all' do
    it 'displays all Spaces' do 

      DatabaseConnection.query(
        "INSERT INTO spaces (name, description, price, creator) values ($1, $2, $3, $4);", ['Space1', "The first space", "100", 1]
      )
      DatabaseConnection.query(
        "INSERT INTO spaces (name, description, price, creator) values ($1, $2, $3, $4);", ['Space2', "The second space", "200", 1]
      )

      spaces = Space.all
      expect(spaces.length).to eq 2
      expect(spaces.first).to be_a Space 
      expect(spaces.first.name).to eq "Space1"
    end
  end

  describe '.create' do 
    it 'creates a new space in the database' do 
      Space.create(
        name: "Test Space", 
        description: "this is a description",
        price: '100',
        creator: '1')
      
      spaces = Space.all
      test_space = DatabaseConnection.query("SELECT * FROM spaces WHERE name = 'Test Space';")

      expect(test_space[0]['description']).to eq "this is a description"
      expect(spaces.last.id).to eq test_space[0]['id']
    end
  end

  describe '.mine' do 
    it 'lists all spaces a user has created' do
      DatabaseConnection.query(
        "INSERT INTO spaces (name, description, price, creator) values ($1, $2, $3, $4);", ['Space1', "The first space", "100", '1']
      )
      DatabaseConnection.query(
        "INSERT INTO spaces (name, description, price, creator) values ($1, $2, $3, $4);", ['Space2', "The second space", "200", '2']
      ) 
      
      user_spaces = Space.mine('1')

      expect(user_spaces.last.name).not_to include 'Space2'
      expect(user_spaces.first.name).to eq 'Space1'

    end
  end
end