json.(@inquiries) do |inquiry|
  json.id inquiry.id
  json.name inquiry.name
  json.phone inquiry.phone
  json.read inquiry.read
  json.email inquiry.email
  json.subject inquiry.subject
  json.ip_address inquiry.ip_address
  json.http_user_agent inquiry.http_user_agent
  json.created_at inquiry.created_at
end