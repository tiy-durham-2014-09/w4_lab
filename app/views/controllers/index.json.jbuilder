json.array!(@controllers) do |controller|
  json.extract! controller, :id, :Users
  json.url controller_url(controller, format: :json)
end
