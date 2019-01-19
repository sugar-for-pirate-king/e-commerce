require 'rails_helper'

RSpec.feature "UserRegisters", type: :feature do
  context 'with valid params' do
    before do
      visit new_user_path
    end

    it 'is must contains title user register' do
      expect(page).to have_content 'User register'
    end

    it 'is will save user to database' do
      expect {
        fill_in 'user[username]', with: 'pquest'
        fill_in 'user[password]', with: 'secret123'
        fill_in 'user[password_confirmation]', with: 'secret123'

        click_button 'Save user boii'

        expect(page).to have_content 'User telah dibuat!'
      }.to change{ User.count }.by(1)
    end
  end
end
