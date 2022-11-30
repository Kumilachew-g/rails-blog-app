require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe 'GET /index' do
        before(:example) { get '/users/posts' }
    
        it 'Is response status correct' do
          expect(response).to have_http_status(:ok)
        end
    end
end