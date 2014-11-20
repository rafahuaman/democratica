module CongressMemberUtility
  def valid_congress_member_form_completion(member_info)
    fill_in "First name", with: member_info[:first_name]
    fill_in "Last name", with: member_info[:last_name]
    fill_in 'State', with: member_info[:state]
    fill_in 'District', with: member_info[:district]
    fill_in 'Party', with: member_info[:party]
    fill_in 'Twitter handle', with: member_info[:twitter_handle]
    select member_info[:type_by_house], :from => 'Type by house'
  end

  RSpec::Matchers.define :have_new_congress_member_page_appearance do
    match do |page|
      expect(page).to have_title('New congress member')
      expect(page).to have_content('New congress member')
      expect(page).to have_content('First name')
      expect(page).to have_content('Last name')
      expect(page).to have_content('State')
      expect(page).to have_content('District')
      expect(page).to have_content('Party')
      expect(page).to have_content('Twitter handle')
      expect(page).to have_content('Type by house')
    end
  end

  RSpec::Matchers.define :have_senator_show_data do |congress_member|
    match do |page|
      expect(page).to have_content(congress_member[:first_name])
      expect(page).to have_content(congress_member[:last_name])
      expect(page).to have_content(congress_member[:state])
      expect(page).to have_content(congress_member[:party])
      expect(page).to have_content(congress_member[:twitter_handle])
      expect(page).to have_content(congress_member[:type_by_house])
    end
  end

  RSpec::Matchers.define :have_representative_show_data do |congress_member|
    match do |page|
      expect(page).to have_content(congress_member[:first_name])
      expect(page).to have_content(congress_member[:last_name])
      expect(page).to have_content(congress_member[:district])
      expect(page).to have_content(congress_member[:state])
      expect(page).to have_content(congress_member[:party])
      expect(page).to have_content(congress_member[:twitter_handle])
      expect(page).to have_content(congress_member[:type_by_house])
    end
  end

  RSpec::Matchers.define :have_congress_member_created_successfully_message  do
    match do |page|
      expect(page).to have_selector("div.alert-box", text: "Congress Member was successfully created")
    end
  end
end

RSpec.configure do |c|
  c.include CongressMemberUtility
end