json.array!(@pair_places) do |pair_place|
  json.extract! pair_place, :nickname, :street, :city, :country
  json.url pair_place_url(pair_place, format: :json)
end