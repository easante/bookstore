require 'spec_helper'

feature 'Creating Books' do
  let!(:wiley) { Fabricate(:publisher, name: 'Wiley') }
  let!(:author1) { Fabricate(:author, first_name: 'Agatha', last_name: 'Christie') }
  let!(:author2) { Fabricate(:author, first_name: 'Ryan', last_name: 'Bigg') }
  let(:admin) { Fabricate(:admin) }

  before do
    signin_as admin
  end


  scenario 'create a valid book' do
    visit root_path

    click_link 'Books', exact: false
    click_link 'Add New book'

    fill_in 'Title', with: 'John Bull'
    fill_in 'Isbn', with: 'John Bull'
    fill_in 'Page count', with: 189
    fill_in 'Price', with: 54.23
print page.html
    fill_in 'Description', with: 'John Bull'
    fill_in 'Published at', with: '2014-01-01'
    select 'Wiley', from: 'Publisher'
    attach_file 'Book cover', 'db/Proforma 1.jpg'
    select 'Agatha Christie', from: 'Author'
    click_link 'Add another author'

    select 'Ryan Bigg', from: 'Author'
    click_button 'Create Book'

    expect(page).to have_content('Book has been created.')
  end

  scenario 'creating book with invalid fields fails' do
    visit root_path

    click_link 'Books', exact: false
    click_link 'Add New book'
#print page.html
    fill_in 'Title', with: ''
    fill_in 'Isbn', with: 'John Bull'
    fill_in 'Page count', with: 189
    fill_in 'Price', with: 54.23
    fill_in 'Description', with: 'John Bull'
    fill_in 'Published at', with: '2014-01-01'
    select 'Wiley', from: 'Publisher'
    attach_file 'Book cover', 'db/Proforma 1.jpg'
    select 'Agatha Christie', from: 'Author'
    click_link 'Add another author'

    click_button 'Create Book'

    expect(page).to have_content('Book has not been created.')
    expect(page).to have_content("can't be blank")
  end
end
