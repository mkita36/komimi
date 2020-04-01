json.extract! profile, :id, :user_id, :self_introduction, :birth_year, :live_in, :created_at, :updated_at
json.url profile_url(profile, format: :json)
