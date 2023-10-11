json.extract! assignment, :id, :assignment_name, :description, :deadline, :completion_status, :created_at, :updated_at
json.url assignment_url(assignment, format: :json)
