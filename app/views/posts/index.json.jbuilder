json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :author, :published_date
  json.url post_url(post, format: :json)
end
