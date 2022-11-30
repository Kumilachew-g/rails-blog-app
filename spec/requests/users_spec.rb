require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Check is correct template rendered' do
      expect(response).to render_template(:index)
    end

    it 'Check is the body includes correct text' do
      expect(response.body).to include('INDEX')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:user_id' }

    it 'Check is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Check is correct template rendered' do
      expect(response).to render_template(:show)
    end
  end
end
