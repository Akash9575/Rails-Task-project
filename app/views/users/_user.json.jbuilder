json.extract! user, :id, :name, :email, :email_confirmation, :phone_num, :state, :city, :pincode, :created_at, :updated_at
json.url user_url(user, format: :json)
