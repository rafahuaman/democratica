json.array!(@rallies) do |rally|
  json.extract! rally, :id, :title, :content, :twitter_template, :user_id
  json.url rally_url(rally, format: :json)
end
