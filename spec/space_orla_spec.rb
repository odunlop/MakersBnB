require 'space_orla'

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
end