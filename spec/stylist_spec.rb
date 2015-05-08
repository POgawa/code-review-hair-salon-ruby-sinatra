require "spec_helper"

describe(Stylist) do

  describe("#save") do
    it("add the stylist to the database") do
      test_stylist = Stylist.new({:name => "new stylist", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end


  end
end
