json.array!(@brands) do |brand|
  json.extract! brand, :id, :title, :logo_url, :tagline, :home_link, :github_link, :gitter_link, :footer_text, :footer_img, :footer_chatlink
  json.url brand_url(brand, format: :json)
end
