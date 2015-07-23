json.array!(@guest_lists) do |guest_list|
  json.extract! guest_list, :id, :wedding_id
  json.url guest_list_url(guest_list, format: :json)
end
