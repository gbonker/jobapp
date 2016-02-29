json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :description, :created_at
  json.url post_url(post, format: :json)
end
