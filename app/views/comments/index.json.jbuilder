json.array!(@comments) do |comment|
  json.extract! comment, :id, :user, :post, :body
  json.url comment_url(comment, format: :json)
end
