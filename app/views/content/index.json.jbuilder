json.array!(@contents) do |content|
  json.extract! content, :id, :wedding_id
  json.url content_url(content, format: :json)
end
