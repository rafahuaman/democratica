module CongressMemberUtility
  def valid_congress_member_form_completion(member_info)
    fill_in "First name", with: member_info[:first_name]
    fill_in "Last name", with: member_info[:last_name]
    fill_in 'State', with: member_info[:state]
    fill_in 'District', with: member_info[:district]
    fill_in 'Party', with: member_info[:party]
    fill_in 'Twitter handle', with: member_info[:twitter_handle]
    select member_info[:type], :from => 'Type'
  end
end

RSpec.configure do |c|
  c.include CongressMemberUtility
end