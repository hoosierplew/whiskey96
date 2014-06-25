json.array!(@ratings) do |rating|
  json.extract! rating, :id, :whiskey_id, :person_id, :nose, :taste, :finish, :balance, :review
  json.url rating_url(rating, format: :json)
end
