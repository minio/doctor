json.array!(@documents) do |document|
  json.extract! document, :id, :name, :description, :link, :category_id
  json.url document_url(document, format: :json)
end
