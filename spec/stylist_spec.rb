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



  end
end
