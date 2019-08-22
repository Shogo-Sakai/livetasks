json.array!(@tasks) do |task|
  json.extract! task, :id, :content, :live_id
  json.start    task.start_date
  json.end      task.finish_date
  json.url      task_url(task, format: :html)
end