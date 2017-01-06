json.extract! profile, :id, :fullname, :email, :birthdate, :is_male, :address, :phone, :created_at, :updated_at
json.url profile_url(profile, format: :json)