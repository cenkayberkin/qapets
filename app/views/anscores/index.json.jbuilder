json.array!(@anscores) do |anscore|
  json.extract! anscore, :id
  json.url anscore_url(anscore, format: :json)
end
