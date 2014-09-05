module AuthenticationHelpers
  def signin_as(user)
    visit root_path
    click_link 'Sign in'
    fill_in "Email Address", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Sign in successful.")
end end
RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end
