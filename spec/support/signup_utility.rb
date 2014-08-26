module SignUpUtility
  def valid_signup_form_completion(signup_information)
    fill_in "Name", with: signup_information[:name]
    fill_in "Email", with: signup_information[:email]
    fill_in 'Password', with: signup_information[:password], match: :prefer_exact
    fill_in 'Password confirmation', with: signup_information[:password], match: :prefer_exact
  end
  
  def invalid_signup_password_missmatch
    fill_in "Name", with: "Example"
    fill_in "Email", with: "user@example.com"
    fill_in 'Password', with: "foobar", match: :prefer_exact
    fill_in 'Password confirmation', with: "wibble", match: :prefer_exact
  end  
  
  RSpec::Matchers.define :have_signup_page_appearance do
    match do |page|
      expect(page).to have_content('Sign up')
    expect(page).to have_title('Sign up')
    end
  end
  
  RSpec::Matchers.define :have_invalid_signup_with_blanks_message do
    match do |page|
      expect(page).to have_selector("div.alert-box", text: "Please review the problems below:")
      expect(page).to have_content("can't be blank")
      expect(page).to have_content('is too short (minimum is 6 characters)')
    end
  end

  RSpec::Matchers.define :have_user_creation_success_message do
    match do |page|
      expect(page).to have_selector("div.alert-box.radius.success", text: "User was successfully created.")
    end
  end
end

RSpec.configure do |c|
  c.include SignUpUtility
end