json.array!(@events) do |event|
  json.extract! event, :id, :title, :venue, :street_number, :city, :sttate, :zip, :description, :url, :image, :category
  json.url event_url(event, format: :json)
end
