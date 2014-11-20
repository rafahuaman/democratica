class CongressMemberFinder
  def self.get_all(user)
    senator = CongressMember.find_by(state: user.state, type_by_house: "Senator")
    rep = CongressMember.find_by(state: user.state, district: user.district, type_by_house: "Representative")
    [ senator, rep]
  end
end