json.array!(@todos) do |todo|
  json.extract! todo, :id, :name, :note, :due_date, :done
  json.url todo_url(todo, format: :json)
end
