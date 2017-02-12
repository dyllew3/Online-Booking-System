json.extract! user, :id, :first_name, :last_name, :password_digest, :email, :authenticated, :admin, :students, :created_at, :updated_at
json.url user_url(user, format: :json)