json.array! @todos do |todo|\
  json.(todo, :id, :content)
  json.updated_at todo.updated_at.strftime('%m/%d/%Y %H:%M:%S')
end
