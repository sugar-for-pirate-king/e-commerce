require 'rails_helper'

RSpec.describe "Users API ", type: :request do
  describe "GET /api/users/:id" do
    let!(:user) { create(:user) }

    let(:expected_response) do
      {
        user: {
          id: user.id,
          username: user.username
        }
      }.to_json
    end

    context 'with valid params' do
      it 'is shows user json' do
        get "/api/users/#{user.id}"

        expect(response.body).to eq expected_response
      end
    end
  end
end
