require('rspec')
require('pg')
require('task')
require('list')

DB = PG.connect({:dbname => 'my_database_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks * ;")
  end
end
