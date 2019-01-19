require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with username, password and password_confirmation' do
    user = build(:user)
    user.valid?
    expect(user.errors).to be_empty
  end

  it 'is invalid without username' do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid with username has been taken' do
    old_user = create(:user, username: 'fauzan')
    new_user = build(:user, username: 'fauzan')

    new_user.valid?

    expect(new_user.errors[:username]).to include('has already been taken')
  end

  it 'is invalid without password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid without password_confirmation' do
    user = build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end
end
