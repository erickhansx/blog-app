require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      expect(1 + 1).to eql(2)
    end
  end
end
