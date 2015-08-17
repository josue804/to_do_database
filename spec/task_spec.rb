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
      test_task = Task.new({:description => 'go to school', :id => nil})
      expect(test_task.description()).to(eq('go to school'))
    end
  end

  describe('#save') do
    it('saves the task to the database') do
      test_task = Task.new({:description => 'put socks on', :id => nil})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      test_task = Task.new({:description => 'drink water', :id => nil})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#save') do
    it('saves a task to database') do
      test_task = Task.new({:description => 'drink water', :id => nil})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
end
