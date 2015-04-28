json.(Medium.includes(:uploader)) do |medium|
  json.id medium.id
  json.filename medium.filename
  json.created_at medium.created_at
  json.uploader_name medium.uploader_name
  json.size number_to_human_size(medium.size)
  json.mimetype medium.mimetype
  json.url medium.url
end