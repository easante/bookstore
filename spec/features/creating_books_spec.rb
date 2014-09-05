require 'spec_helper'

feature 'Creating Books' do
  let!(:wiley) { Fabricate(:publisher, name: 'Wiley') }
  let(:admin) { Fabricate(:admin) }

  before do
    signin_as admin
  end


  scenario 'create a valid book' do
    visit root_path
    #Capybara.exact = true
    click_link 'Books', exact: false
    click_link 'Add New book'

    fill_in 'Title', with: 'John Bull'
    fill_in 'Isbn', with: 'John Bull'
    fill_in 'Page count', with: 189
    fill_in 'Price', with: 54.23
    #Capybara.exact = false
    fill_in 'Description', with: 'John Bull'
    fill_in 'Published at', with: '2014-01-01'
    select 'Wiley', from: 'Publisher'
    click_button 'Create Book'

    expect(page).to have_content('Book has been created.')
  end

  scenario 'creating book with invalid fields fails' do
    visit root_path
    #Capybara.exact = true
    click_link 'Books', exact: false
    click_link 'Add New book'

    fill_in 'Title', with: ''
    fill_in 'Isbn', with: 'John Bull'
    fill_in 'Page count', with: 189
    fill_in 'Price', with: 54.23
    fill_in 'Description', with: 'John Bull'
    fill_in 'Published at', with: '2014-01-01'
    select 'Wiley', from: 'Publisher'
    click_button 'Create Book'

    expect(page).to have_content('Book has not been created.')
    expect(page).to have_content("can't be blank")
  end
end
