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

  context 'show action' do
    it 'successfully render post details' do
      posted = create(:post)

      get "/api/v1/posts/#{posted.id}"

      expect(response.status).to eq(200)
      expect(response.body).to include(posted.title)
      expect(response.body).to include(posted.description)
    end
  end

  context 'create action' do
    it 'successfully create post' do
      post_params = attributes_for(:post)

      post '/api/v1/posts', params: {post: post_params}

      expect(response.status).to eq(201)
      expect(response.body).to include(post_params[:title])
      expect(response.body).to include(post_params[:description])
    end

    it 'failed to  create post' do
      post_params = {title: '', description: ''}

      post '/api/v1/posts', params: {post: post_params}

      expect(response.status).to eq(422)
      expect(response.body).to include("Title can't be blank")
      expect(response.body).to include("Description can't be blank")
    end
  end
end
