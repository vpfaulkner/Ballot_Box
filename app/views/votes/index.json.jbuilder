json.array!(@votes) do |vote|
  json.extract! vote, :id, :voter_id, :canidate_id
  json.url vote_url(vote, format: :json)
end
