require "spec_helper"

describe(Stylist) do

  describe("#==") do
    it("is true for tasks with the same attributes") do
        task1 = Stylist.new({:name => "Jennifer", :id => nil, :stylist_id => 1})
        task2 = Stylist.new({:name => "Jennifer", :id => nil, :stylist_id => 1})
        expect(task1).to eq(task2)
      end
    end

  describe("#save") do
    it("adds the task to the tasks table") do
      test_task = Stylist.new({:name => "Jennifer", :id => nil, :stylist_id => 1})
      test_task.save()
      expect(Stylist.all()).to(eq([test_task]))
    end
  end
end
