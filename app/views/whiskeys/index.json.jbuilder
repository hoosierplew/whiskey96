json.array!(@whiskeys) do |whiskey|
  json.extract! whiskey, :id, :type, :tags, :distillery, :name, :description, :image
  json.url whiskey_url(whiskey, format: :json)
end
