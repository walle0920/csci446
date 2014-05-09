json.array!(@fostereds) do |fostered|
  json.extract! fostered, :id
  json.url fostered_url(fostered, format: :json)
end
