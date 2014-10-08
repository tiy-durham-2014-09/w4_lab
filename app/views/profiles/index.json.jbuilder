json.array!(@profiles) do |profile|
  json.extract! profile, :id, :bio, :location, :website
  json.url profile_url(profile, format: :json)
end
