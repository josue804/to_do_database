require('rspec')
require('pg')
require('task')

DB = PG.connect({:dbname => 'my_database_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks * ;")
  end
end

describe(Task) do

  describe('#description') do
    it('returns the task at hand') do
      test_Task = Task.new({:description => 'go to school', :id => 1})
      expect(test_Task.description()).to(eq('go to school'))
    end
  end

  describe('#save') do
    it('saves the task to the database') do
      test_Task = Task.new({:description => 'put socks on', :id => 2})
      expect(test_Task.save()).to(eq([test_Task]))
    end
  end
end
