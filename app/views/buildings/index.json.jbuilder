json.array!(@buildings) do |building|
  json.extract! building, :id, :type, :area, :address, :rooms_number, :parking_number, :description, :user_id
  json.url building_url(building, format: :json)
end
