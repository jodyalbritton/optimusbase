json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :published_at, :author_id, :draft, :excerpt
  json.url post_url(post, format: :json)
end
