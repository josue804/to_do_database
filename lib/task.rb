class Task
  @@Task = []
  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  # define_method(:all) do
  #   results = DB.exec("SELECT * FROM tasks;")
  #   tasks = []
  #   results.each() do |result|
  #     description = result['description']
  #     tasks << Task.new({})
  # end

  define_method(:save) do
    @@Task.push(self)
  end
end
