module RallyUtility
  def valid_rally_form_completion(member_info)
    fill_in "Title", with: member_info[:title]
    fill_in "Content", with: member_info[:content]
    fill_in 'Twitter template', with: member_info[:twitter_template]
  end

  RSpec::Matchers.define :have_new_rally_page_appearance do
    match do |page|
      expect(page).to have_title('New rally')
      expect(page).to have_content('New rally')
      expect(page).to have_content('Title')
      expect(page).to have_content('Content')
      expect(page).to have_content('Twitter template')
    end
  end

  RSpec::Matchers.define :have_rally_show_data do |rally|
    match do |page|
      expect(page).to have_content(rally[:title])
      expect(page).to have_content(rally[:content])
      expect(page).to have_content(rally[:twitter_template])
    end
  end

  RSpec::Matchers.define :have_invalid_new_rally_with_blanks_message do
    match do |page|
      expect(page).to have_selector("div.alert-box", text: "Please review the problems below:")
      expect(page).to have_content("can't be blank")
    end
  end

  RSpec::Matchers.define :have_rally_created_successfully_message  do
    match do |page|
      expect(page).to have_selector("div.alert-box", text: "Rally was successfully created")
    end
  end

  RSpec::Matchers.define :have_rally_links_for_owner do |rally|
    match do |page|
      expect(page).to have_link("edit", edit_rally_path(rally))
      expect(page).to have_link("delete", rally_path(rally))
    end
  end
end


RSpec.configure do |c|
  c.include RallyUtility
end