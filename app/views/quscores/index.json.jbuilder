json.array!(@quscores) do |quscore|
  json.extract! quscore, :id
  json.url quscore_url(quscore, format: :json)
end
