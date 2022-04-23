require 'rails_helper'
RSpec.describe 'Login User', type: :system do
  describe 'Log in existing user' do
    before :each do
      @user = User.create!(
        name: 'King',
        email: 'king@example.com',
        password: 'king123'
      )
      visit new_user_session_path
      fill_in 'Email', with: 'king@example.com'
      fill_in 'Password', with: 'king123'
      click_button 'Log in'

      visit home_pages_path
    end

    it 'should redirect to the right path' do
      click_link 'Add a new category'
      expect(current_path).to eq(new_home_page_path)
    end
  end
end
