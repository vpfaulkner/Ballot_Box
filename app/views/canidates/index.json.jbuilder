json.array!(@canidates) do |canidate|
  json.extract! canidate, :id, :name, :party
  json.url canidate_url(canidate, format: :json)
end
