json.array!(@todos) do |todo|
  json.extract! todo, :id, :item, :note, :date, :complete
  json.url todo_url(todo, format: :json)
end
