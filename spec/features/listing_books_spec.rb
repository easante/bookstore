require 'spec_helper'

feature 'Listing Books' do
  let!(:book1) { Fabricate(:book) }
  let!(:book2) { Fabricate(:book) }
  let(:admin) { Fabricate(:admin) }

  before do
    signin_as admin
  end

  scenario 'successfully list all books' do
    visit root_path

    click_link 'Books'

    expect(page).to have_content('All Books')
    expect(current_path).to eq(books_path)
  end

  scenario 'failed listing of all books' do
    visit root_path
    click_link 'Sign out'

    visit books_path

    expect(page).to have_content('Please sign in first!')
    expect(current_path).to eq(signin_path)
  end


end
