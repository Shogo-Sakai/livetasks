json.array!(@tasks) do |event|
  json.extract! event, :id
  json.title    event.content
  json.start    event.start_date
  json.end      event.finish_date
  # json.url      task_url(task, format: :html)
end