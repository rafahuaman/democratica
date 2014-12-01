class CongressMemberFinder
  def self.get_all(user)
    senator = CongressMember.find_by(state: user.state, type_by_house: "Senator")
    rep = CongressMember.find_by(state: user.state, district: user.district, type_by_house: "Representative")
    {senator: senator, representative: rep }
  end

  def self.get_senator(user)
    CongressMember.find_by(state: user.state, type_by_house: "Senator")
  end

  def self.get_representative(user)
    CongressMember.find_by(state: user.state, district: user.district, type_by_house: "Representative")
  end
end