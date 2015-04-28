json.(@users) do |user|
  json.id user.id
  json.name user.name
  json.role user.role
  json.email user.email
  json.username user.username
  json.sign_in_count user.sign_in_count
end