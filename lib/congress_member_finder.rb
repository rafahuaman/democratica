class CongressMemberFinder
  def self.get_all(user)
    senators = get_senators(user)
    rep =  get_representative(user)
    {senators: senators, representative: rep }
  end

  def self.get_senators(user)
    senators = CongressMember.where(state: user.state, type_by_house: "Senator")
    senators unless senators.empty?
  end

  def self.get_representative(user)
    CongressMember.find_by(state: user.state, district: user.district, type_by_house: "Representative")
  end
end