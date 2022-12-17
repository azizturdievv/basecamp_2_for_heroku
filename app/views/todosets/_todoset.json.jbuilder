json.extract! todoset, :id, :name, :description, :project_id, :created_at, :updated_at
json.url todoset_url(todoset, format: :json)
