require 'pg'

class DatabaseConnection
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'makersbnb_test')
    else
      @connection = PG.connect(dbname: 'makersbnb')
    end
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end