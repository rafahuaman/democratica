class CongressMemberFinder
  def self.get_all(user)
    senator = Senator.find_by(state: user.state)
    rep = Representative.find_by(state: user.state, district: user.district)
    [ senator, rep]
  end
end