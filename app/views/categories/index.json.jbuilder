json.array!(@categories) do |category|
  json.extract! category, :id, :title, :desc
  json.url category_url(category, format: :json)
end
