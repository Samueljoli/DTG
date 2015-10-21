json.array!(@events) do |event|
  json.extract! event, :id, :title, :venue, :street_number, :street_name, :city, :state, :zip, :description, :cost, :tickets, :url, :image, :category
  json.url event_url(event, format: :json)
end
