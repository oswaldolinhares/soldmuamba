json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :name, :brand, :year, :km, :description, :description_vehicle, :user_id
  json.url vehicle_url(vehicle, format: :json)
end
