require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe "GET /index" do
        before(:example) { get users_path } 
    
        it "Check is correct template rendered" do
            expect(response).to render_template('index')
          end
      end
end