require 'spec_helper'

feature 'Creating a home page' do
  scenario 'create a home page' do
    visit root_path

    expect(page).to have_content('Bookstore App')
  end
end
