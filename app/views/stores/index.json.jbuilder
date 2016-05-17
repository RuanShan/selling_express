json.array!(@stores) do |store|
  json.extract! store, :id, :name, :store_type
  json.url store_url(store, format: :json)
end
