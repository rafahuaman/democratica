json.array!(@representatives) do |representative|
  json.extract! representative, :id, :prefix, :first_name, :middle_name, :last_name, :suffix, :address, :city, :state, :zip4, :district, :party, :twitter_handle
  json.url representative_url(representative, format: :json)
end
