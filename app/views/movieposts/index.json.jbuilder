json.array!(@movieposts) do |moviepost|
  json.extract! moviepost, :id, :content
  json.url moviepost_url(moviepost, format: :json)
end
