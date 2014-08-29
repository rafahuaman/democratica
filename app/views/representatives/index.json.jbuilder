json.array!(@congress_members) do |member|
  json.extract! member, :id, :prefix, :first_name, :middle_name, :last_name, :suffix, :address, :city, :state, :zip4, :district, :party, :twitter_handle
  json.url congress_member_url(member, format: :json)
end
