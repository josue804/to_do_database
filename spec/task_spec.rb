require('spec_helper')

describe(Task) do

  describe('#description') do
    it('returns the task at hand') do
      test_task = Task.new({:description => 'go to school', :list_id => nil, :due_date => '2015-09-03'})
      expect(test_task.description()).to(eq('go to school'))
    end
  end

  describe('#save') do
    it('saves the task to the database') do
      test_task = Task.new({:description => 'put socks on', :list_id => nil, :due_date => '2015-09-03'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      test_task = Task.new({:description => 'drink water', :list_id => nil, :due_date => '2015-09-03'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#save') do
    it('saves a task to database') do
      test_task = Task.new({:description => 'drink water', :list_id => nil, :due_date => '2015-09-03'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.sort') do
    it('sorts the tasks') do
      test_task1 = Task.new({:description => 'bring hiking boots', :list_id => nil, :due_date => '2015-09-03'})
      test_task1.save()
      test_task2 = Task.new({:description => 'bring granola', :list_id => nil, :due_date => '2015-08-03'})
      test_task2.save()
      test_task3 = Task.new({:description => 'bring water', :list_id => nil, :due_date => '2015-07-03'})
      test_task3.save()

      expect(Task.sort()).to(eq([test_task1, test_task2, test_task3]))
    end
  end
end
