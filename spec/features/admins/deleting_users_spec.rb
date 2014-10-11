require 'spec_helper'

feature 'Creating Users' do
  let(:admin) { Fabricate(:admin) }
  let!(:user) { Fabricate(:user, first_name: 'John') }

  before do
    signin_as admin
  end

  scenario 'deleting a user' do
    visit root_path

    click_link 'Users', exact: false
    click_link user.email
    click_link 'Delete'

    expect(page).to have_content('User has been deleted.')
  end

end
