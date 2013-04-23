json.array!(@organizations) do |organization|
  json.extract! organization, :name, :description, :organization_url
  json.url organization_url(organization, format: :json)
end