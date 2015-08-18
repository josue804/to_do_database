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

post('/lists') do
  name = params.fetch('name')
  list = List.new({:name => name, :id => nil})
  list.save()
  @lists = List.all()
  erb(:index)
end

get('/list/:id') do
  @list = List.find(params.fetch('id').to_i())
  erb(:list)
end
