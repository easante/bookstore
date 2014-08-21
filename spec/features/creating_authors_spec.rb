require 'spec_helper'

feature 'Creating Authors' do
  scenario 'create a valid author' do
    visit root_path
    click_link 'Authors'
    click_link 'Add New author'

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Bull'
    click_button 'Create Author'

    expect(page).to have_content('Author has been created.')
  end

  scenario 'creating author with invalid fields fails' do
    visit root_path
    click_link 'Authors'
    click_link 'Add New author'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Bull'
    click_button 'Create Author'

    expect(page).to have_content('Author has not been created.')
    expect(page).to have_content("can't be blank")
  end
end
