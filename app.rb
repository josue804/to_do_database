require('sinatra')
require('sinatra/reloader')
require('./lib/list')
require('./lib/task')
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})

get('/') do
  @lists = List.all()
  erb(:index)
end

# get ('lists/new') do
#   erb(:list_form)
# end

post('/') do
  name = params.fetch('list_name')
  list = List.new({:name => name, :id => nil})
  list.save()
  @lists = List.all()
  erb(:index)
end

get('/lists/:id') do
  @list = List.all()
  @tasks = Task.all()
  @id = params.fetch('id').to_i()
  erb(:list)
end

post('/lists/:id') do
  description = params.fetch('task_description')
  due_date = params.fetch('due_date')
  @list_id = params.fetch('id').to_i()
  task = Task.new({:description => description, :due_date => due_date, :list_id => @list_id})
  task.save()
  @tasks = Task.all()
  erb(:list)
end
# get('tasks')
