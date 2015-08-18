class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM list;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_method(:==) do |other|
    self.name().eql?(other.name()) && self.id().eql?(other.id())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO list (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name()).&(self.id().==(another_list.id))
  end

  def tasks
    result = DB.exec("SELECT * FROM tasks WHERE list_id = #{id()};")
  end

  define_singleton_method(:find) do |id|
    returned_lists = []
    List.all().each() do |list|
      if list.id().==(id)
        found_list = list
      end
    end
    found_list
  end
end
