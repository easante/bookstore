require 'spec_helper'

feature 'Deleting Books' do
  let(:admin) { Fabricate(:admin) }

  before do
    signin_as admin
  end

  scenario 'deleting a book' do
    book = Fabricate(:book)
    visit root_path
    click_link 'Books'
    click_link book.title
    click_link 'Delete'

    expect(page).to have_content('Book has been deleted.')
    expect(page.current_path).to eq(books_path)
  end

end
