require "spec_helper"

describe(Client) do

  describe("#==") do
    it("is true for clients with the same attributes") do
        client1 = Client.new({:name => "Jennifer", :id => nil, :stylist_id => 1})
        client2 = Client.new({:name => "Jennifer", :id => nil, :stylist_id => 1})
        expect(client1).to eq(client2)
      end
    end

  describe("#save") do
    it("adds the client to the clients table") do
      test_client = Client.new({:name => "Jennifer", :id => nil, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#delete") do
      it("deletes a client from the clients table") do
        client1 = Client.new({:name => 'Jennifer', :id => nil, :stylist_id => 1})
        client1.save()
        client2 = Client.new({:name => 'Carrie', :id => nil, :stylist_id => 1})
        client2.save()
        client1.delete()
        expect(Client.all()).to(eq([client2]))
      end
    end

    describe("#update") do
      it("updates the client object's name") do
        client1 = Client.new({:name => 'Jennifer', :id => nil, :stylist_id => 1})
        client1.save()
        client1.update({:name => 'Jen'})
        expect(client1.name()).to(eq('Jen'))
      end

end



end
