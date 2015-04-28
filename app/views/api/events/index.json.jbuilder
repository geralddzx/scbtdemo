@events = Event.includes(:author)
@events = @events.where(display: true) unless current_user && current_user.admin?

json.(@events) do |event|
  json.id event.id
  json.title event.title
  json.content event.content
  json.location event.location
  json.datetime event.display_datetime
  json.author_name event.author_name
  json.display event.display
end