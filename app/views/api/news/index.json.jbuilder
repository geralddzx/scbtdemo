json.(News.includes(:author)) do |new|
  json.id new.id
  json.title new.title
  json.description new.description
  json.datetime new.display_datetime
  json.author_name new.author_name
end