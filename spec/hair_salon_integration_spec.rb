require('capybara/rspec')
require('./app')
require "spec_helper"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creating a stylist', {:type => :feature}) do
  it('processes user entry to create stylist') do
    visit'/'
    click_link'Add a new styist'
    fill_in('name', :with => 'Wanda')
    click_button('Enter new stylist')
    expect(page).to have_content('Wanda')
  end
end

describe('changing a stylist name', {:type => :feature}) do
  it('processes operator entry to change a stylist name') do
    new_stylist = Stylist.new({:name => 'Wanda', :id => nil})
    new_stylist.save()
    visit("/stylist/#{new_stylist.id}")
    click_link("Edit stylist")
    fill_in("name", :with => "Theresa")
    click_button("Update")
    click_link'View styists'
    expect(page).to have_content("Theresa")
  end
end
