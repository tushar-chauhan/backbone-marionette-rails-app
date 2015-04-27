unless @todo.errors.any?
  json.(@todo, :id, :content)
  json.updated_at @todo.updated_at.strftime('%m/%d/%Y %H:%M:%S')
else
  json.errors(@todo.errors)
end
