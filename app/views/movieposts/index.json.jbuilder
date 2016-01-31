json.array!(@movieposts) do |moviepost|
  json.extract! moviepost, :id, :img, :title, :content
  json.url moviepost_url(moviepost, format: :json)
end
