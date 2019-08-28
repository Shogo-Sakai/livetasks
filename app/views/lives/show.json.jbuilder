json.array!(@live) do |event|
  json.extract! event, :id
  json.title    event.name
  json.start    event.date
  # json.start    event.start_time
  # json.url      event_url(event, format: :html)
end