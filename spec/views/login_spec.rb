require 'rails_helper'
RSpec.describe 'Login User', type: :system do
  describe 'Log in existing user' do
    before :each do
      @user = User.create!(
        name: 'King',
        email: 'king@example.com',
        password: 'king123'
      )
      visit '/users/sign_in'
    end
    it 'shows the right content and placeholders' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end
    it 'when user clicks the login button after entering correct data' do
      fill_in 'Email', with: 'king@example.com'
      fill_in 'Password', with: 'king123'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
    it 'empty email and password' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('')
    end
    it 'incorrect email and password' do
      fill_in 'Email', with: 'king@example.com'
      fill_in 'Password', with: '123'
      click_button 'Log in'
      expect(page).to have_content('')
    end
  end
end
