require "./lib/stylist"
require "./lib/client"
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require "pg"

DB = PG.connect({:dbname => "hair_salon"})

get('/') do

  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylist)
end

get('/stylist/new') do
  erb(:stylist_form)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id'))
  erb(:clients)
end

post('/stylists') do
  name = params.fetch("name")
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:stylist)
end

get('/stylist/:id/new') do
  @stylist = Stylist.find(params.fetch('id'))
  erb(:client_form)
end

post('/stylist/:id') do
  name = params.fetch("name")
  stylist_id = params.fetch("id").to_i
  new_client = Client.new({:name => name, :stylist_id => stylist_id, :id => nil})
  new_client.save
  @stylist = Stylist.find(params.fetch('id'))
  erb(:clients)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylists_edit)
end


patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:index)
end


delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end
