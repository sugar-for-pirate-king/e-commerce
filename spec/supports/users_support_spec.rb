# frozen_string_literal: true

module UsersSupport
  def fill_user_form_with(user)
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
  end
end

RSpec.configure do |config|
  config.include UsersSupport
end