require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /index' do
    before { get '/users' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the appropriate template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      expect(response.body).to include('<h1>User index</h1>')
    end
  end

  describe 'GET /show' do
    before { get '/users/1' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the appropriate template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      expect(response.body).to include('<h1>Showing user</h1>')
    end
  end
end
