class Task
  @@Task = []
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each() do |result|
      description = result.fetch("description")
      tasks.push(Task.new({:description => description, :id => nil}))
    end
    tasks
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}') RETURNING id;")
  end

  define_method(:==) do |other|
    same_description = self.description().eql?(other.description())
    same_description
  end
end
