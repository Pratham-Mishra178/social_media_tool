require 'net/http'
require 'json'

class Post < ApplicationRecord
  def publish_to_linkedin
    uri = URI('https://api.linkedin.com/v2/ugcPosts')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {
      'Authorization' => "Bearer #{user.linkedin_access_token}",
      'Content-Type' => 'application/json'
    })

    request.body = {
      author: "urn:li:person:#{user.linkedin_id}",
      lifecycleState: 'PUBLISHED',
      specificContent: {
        'com.linkedin.ugc.ShareContent': {
          shareCommentary: {
            text: content
          },
          shareMediaCategory: 'NONE'
        }
      },
      visibility: { 'com.linkedin.ugc.MemberNetworkVisibility': 'PUBLIC' }
    }.to_json

    response = http.request(request)
    update(status: 'Published') if response.code == '201'
  end
end
