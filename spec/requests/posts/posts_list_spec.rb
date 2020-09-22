require 'rails_helper'

describe 'Posts list' do
  context 'index action' do
    it 'successfully render json list' do
      posts = create_list(:post, 2)

      get '/api/v1/posts'

      expect(response.status).to eq(200)
      expect(response.body).to include(posts[0].title)
      expect(response.body).to include(posts[0].description)
      expect(response.body).to include(posts[1].title)
      expect(response.body).to include(posts[1].description)
    end
  end
end
