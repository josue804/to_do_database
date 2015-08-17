class Task
  @@Task = []
  attr_reader(:description, :due_date, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @due_date = attributes.fetch(:due_date)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each() do |result|
      description = result.fetch("description")
      due_date = result.fetch("due_date")
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => nil}))
    end
    tasks
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description, due_date, list_id) VALUES ('#{@description}', '#{@due_date}', #{@list_id}) RETURNING id;")
  end

  define_method(:==) do |other|
    same_description = self.description().eql?(other.description())
    same_description
  end

  define_singleton_method(:sort) do
    results = DB.exec("SELECT * FROM tasks ORDER BY due_date ASC;")
    tasks = []
    results.each() do |result|
      description = result.fetch("description")
      due_date = result.fetch("due_date")
      tasks.push(Task.new({:description => description, :list_id => nil, :due_date => due_date}))
    end
    tasks
  end
end
