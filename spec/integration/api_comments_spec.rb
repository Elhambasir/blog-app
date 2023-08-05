require 'swagger_helper'

RSpec.describe 'api/api_comments', type: :request do
  path '/api/v1/comments' do

    post 'Creates a comment' do
      tags 'Comment'
      consumes 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string, required: true },
          post_id: { type: :integer, required: true }
        }
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'This is a new comment', post_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: '' } }
        run_test!
      end
    end
  end
end
