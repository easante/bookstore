require 'spec_helper'

feature 'Editing Authors' do
  let(:admin) { Fabricate(:admin) }
  let!(:author) { Fabricate(:author) }

  before do
#    @author = Fabricate(:author)
    signin_as admin
  end

  scenario 'successfully editing an author' do
    visit root_path
    #require 'pry'; binding.pry
    click_link 'Authors'
    click_link author.full_name
    click_link 'Edit'

    fill_in 'First name', with: 'Paul'
    fill_in 'Last name', with: 'Bull'
    click_button 'Update Author'

    expect(page).to have_content('Author has been updated.')
  end

  scenario 'editing an author with invalid fields fails' do
    visit root_path
    click_link 'Authors'
    click_link author.full_name
    click_link 'Edit'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Bull'
    click_button 'Update Author'

    expect(page).to have_content('Author has not been updated.')
    expect(page).to have_content("can't be blank")
  end
end
