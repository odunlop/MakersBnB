require './lib/db_connection'

if ENV['ENVIRONMENT'] == 'test'
  DBConnection.setup('makers_bnb_test')
else
  DBConnection.setup('makers_bnb')
end
