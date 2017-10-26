require 'rails_helper'

RSpec.describe HealthController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns OK message' do
      get :index, format: :json
      expect(json['status']).to eq('ok')
    end

    it 'returns Mongoid OK message' do
      get :index, format: :json
      mongoid_status = json['results'].find { |x| x['name'] == 'Mongoid' }
      expect(mongoid_status['status']).to eq('OK')
    end
  end
end
