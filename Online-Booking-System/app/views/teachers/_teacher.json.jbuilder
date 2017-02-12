json.extract! teacher, :id, :bio, :subjects, :first_name, :last_name, :password_digest, :email, :authenticated, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)