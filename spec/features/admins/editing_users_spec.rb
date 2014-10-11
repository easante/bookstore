require 'spec_helper'

feature 'Creating Users' do
  let(:admin) { Fabricate(:admin) }
  let!(:user) { Fabricate(:user, first_name: 'John') }

  before do
    signin_as admin
  end


  scenario 'editing a user' do
    visit root_path

    click_link 'Users', exact: false
    click_link user.email
    click_link 'Edit'

    fill_in 'First name', with: 'George'
    fill_in 'Last name', with: 'Bull'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Update User'

    expect(page).to have_content('User has been updated.')
    expect(user.reload.first_name).to eq('George')
  end

  scenario 'editing user with invalid fields fails' do
    visit root_path

    click_link 'Users', exact: false
    click_link user.email
    click_link 'Edit'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Bull'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Update User'

    expect(page).to have_content('User has not been updated.')
    expect(user.reload.first_name).to eq('John')
  end
end
