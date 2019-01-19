require 'rails_helper'

RSpec.feature "User register", type: :feature do
  before do
    visit new_user_path
  end

  it 'is must contains title user register' do
    expect(page).to have_content 'User register'
  end

  context 'with valid params' do
    let(:user) { build(:user) }

    it 'is will save user to database' do
      expect {
        fill_user_form_with(user)

        click_button 'Save user boii'
        expect(page).to have_content 'User telah dibuat!'
      }.to change{ User.count }.by(1)
    end
  end

  context 'with invalid params' do
    context 'not fill username field' do
      let(:user) { build(:user, username: nil) }

      it "is returns error message 'username can't be nil'" do
        expect {
          fill_user_form_with(user)

          click_button 'Save user boi'
        }.to change{ User.count }.by(0)
      end
    end

    context 'not fill password field' do
      let(:user) { build(:user, password: nil) }

      it "is returns error message 'password can't be nil'" do
        expect {
          fill_user_form_with(user)

          click_button 'Save user boi'
        }.to change{ User.count }.by(0)
      end
    end

    context 'fill username that has already in taken' do
      let!(:old_user) { create(:user, username: 'fauzan') }
      let(:new_user) { build(:user, username: 'fauzan') }

      it 'is return error username has been taken' do
        expect {
          fill_user_form_with(new_user)

          click_button 'Save user boi'
        }.to change{ User.count }.by(0)
      end
    end

    context "fill passoword and password_confirmation but does't match" do
      let(:user) { build(:user, password: 'secret123', password_confirmation: 'secret321') }

      it "is returns error 'password doesn't math be nil" do
        expect {
          fill_user_form_with(user)

          click_button 'Save user boi'
        }.to change{ User.count }.by(0)
      end
    end
  end
end
