json.array!(@posts) do |post|
  json.extract! post, :id, :title, :published_date, :content
  json.url post_url(post, format: :json)
end
