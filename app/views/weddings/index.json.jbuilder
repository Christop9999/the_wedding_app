json.array!(@weddings) do |wedding|
  json.extract! wedding, :id, :name, :bride, :groom, :date
  json.url wedding_url(wedding, format: :json)
end
