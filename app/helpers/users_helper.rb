module UsersHelper

  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end

  def us_congressional_districts
    {
      AK: [0],
      AL: [1,2,3,4,5,6,7],
      AR: [1,2,3,4],
      AS: [0],
      AZ: [1,2,3,4,5,6,7,8,9],
      CA: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53],
      CO: [1,2,3,4,5,6,7],
      CT: [1,2,3,4,5],
      DC: [0],
      DE: [0],
      FL: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],
      GA: [1,2,3,4,5,6,7,8,9,10,11,12,13,14],
      GU: [0],
      HI: [1,2],
      IA: [1,2,3,4],
      ID: [1,2],
      IL: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18],
      IN: [1,2,3,4,5,6,7,8,9],
      KS: [1,2,3,4],
      KY: [1,2,3,4,5,6],
      LA: [1,2,3,4,5,6],
      MA: [1,2,3,4,5,6,7,8,9],
      MD: [1,2,3,4,5,6,7,8],
      ME: [1,2],
      MI: [1,2,3,4,5,6,7,8,9,10,11,12,13,14],
      MN: [1,2,3,4,5,6,7,8],
      MO: [1,2,3,4,5,6,7,8],
      MP: [0],
      MS: [1,2,3,4],
      MT: [0],
      NC: [1,2,3,4,5,6,7,8,9,10,11,12,13],
      ND: [0],
      NE: [1,2,3],
      NH: [1,2],
      NJ: [1,2,3,4,5,6,7,8,9,10,11,12],
      NM: [1,2,3],
      NV: [1,2,3,4],
      NY: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],
      OH: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
      OK: [1,2,3,4,5],
      OR: [1,2,3,4,5],
      PA: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],
      PR: [0],
      RI: [1,2],
      SC: [1,2,3,4,5,6,7],
      SD: [0],
      TN: [1,2,3,4,5,6,7,8,9],
      TX: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36],
      UT: [1,2,3,4],
      VA: [1,2,3,4,5,6,7,8,9,10,11],
      VI: [0],
      VT: [0],
      WA: [1,2,3,4,5,6,7,8,9,10],
      WI: [1,2,3,4,5,6,7,8],
      WV: [1,2,3],
      WY: [0]
    }
  end
end
