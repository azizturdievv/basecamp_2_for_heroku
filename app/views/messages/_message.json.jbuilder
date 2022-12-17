json.extract! message, :id, :name, :message_board_id, :created_at, :updated_at
json.url message_url(message, format: :json)
