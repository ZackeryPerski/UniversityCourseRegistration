json.extract! course, :id, :title, :description, :department_id, :code, :credits, :created_at, :updated_at
json.url course_url(course, format: :json)
