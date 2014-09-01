module AuthorizationUtility
  RSpec::Matchers.define :respond_by_redirecting_to_sign_in_page do
    match do |page|
      expect(response).to redirect_to(signin_path)
    end
  end
  
  RSpec::Matchers.define :respond_by_redirecting_to_root_page do
    match do |page|
      expect(response).to redirect_to(root_path)
    end
  end
end

RSpec.configure do |c|
  c.include AuthorizationUtility
end