require('spec_helper')

describe(List) do

  describe('.all') do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same list if it has the same") do
      list1 = List.new({:name => "hiking stuff", :id => nil})
      list2 = List.new({:name => "hiking stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('#save') do
    it("saves a list onto the list table") do
      test_list = List.new({:name => "hiking gear", :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end
end
