json.extract! task, :id, : name, :description, :time, :complited, :created_at, :updated_at
json.url task_url(task, format: :json)
