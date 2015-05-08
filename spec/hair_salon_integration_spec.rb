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
