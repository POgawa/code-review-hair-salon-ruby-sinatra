require "spec_helper"

describe(Stylist) do

  describe("#save") do
    it("add the stylist to the database") do
      test_stylist = Stylist.new({:name => "new stylist", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#==") do
    it("is true for stylists with the same name and id") do
      stylist1 = Stylist.new({:name => "new stylist", :id => nil})
      stylist2 = Stylist.new({:name => "new stylist", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist with a given id") do
      stylist1 = Stylist.new({:name => "new stylist", :id => nil})
      stylist2 = Stylist.new({:name => "second stylist", :id => nil})
      stylist1.save
      stylist2.save
      expect(Stylist.find(stylist2.id)).to(eq(stylist2))
    end
  end

  describe("#clients") do
    it("returns a stylist of clients associated with the stylist.") do
      test_stylist = Stylist.new({:name => "test stylist", :id => nil})
      test_stylist.save
      test_task = Client.new({:name => "Wanda", :id => nil, :stylist_id => test_stylist.id})
      test_task.save
      expect(test_stylist.clients).to eq([test_task])
    end



  end
end
