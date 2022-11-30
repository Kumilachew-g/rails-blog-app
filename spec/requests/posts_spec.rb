require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/posts' }

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template(:index)
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('INDEX')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/posts/:post_id' }

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template(:show)
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('Show')
    end
  end
end
