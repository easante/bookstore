require 'spec_helper'

feature 'Deleting Authors' do
  scenario 'deleting an author' do
    author = Fabricate(:author)
    visit root_path
    click_link 'Authors'
    click_link author.full_name
    click_link 'Delete'

    expect(page).to have_content('Author has been deleted.')
    expect(page.current_path).to eq(authors_path)
  end

end
