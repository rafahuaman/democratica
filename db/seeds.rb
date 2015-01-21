# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
representatives = [
  ["Ralph","Abraham","R","LA",5,"@abraham_ralph"],
  ["Alma","Adams","D","NC",12,"@RepAlmaSAdams"],
  ["Robert","Aderholt","R","AL",4,"@Robert_Aderholt"],
  ["Pete","Aguilar","D","CA",31,"@aguilarpete"],
  ["Rick","Allen","R","GA",12,"@rickallen"],
  ["Justin","Amash","R","MI",3,"@repjustinamash"],
  ["Mark","Amodei","R","NV",2,"@AmodeiNevada"],
  ["Brad","Ashford","D","NE",2,"@RepBradAshford"],
  ["Brian","Babin","R","TX",36,"@Babin4Congress"],
  ["Lou","Barletta","R","PA",11,"@RepLouBarletta"],
  ["Andy","Barr","R","KY",6,"@RepAndyBarr"],
  ["Joe","Barton","R","TX",6,"@RepJoeBarton"],
  ["Karen","Bass","D","CA",37,"@RepKarenBass"],
  ["Joyce","Beatty","D","OH",3,"@JoyceBeatty"],
  ["Xavier","Becerra","D","CA",34,"@repbecerra"],
  ["Dan","Benishek","R","MI",1,"@CongressmanDan"],
  ["Ami","Bera","D","CA",7,"@RepBera"],
  ["Donald","Beyer","D","VA",8,"@RepDonBeyer"],
  ["Gus","Bilirakis","R","FL",12,"@RepGusBilirakis"],
  ["Mike","Bishop","R","MI",8,"@MikeBishopMI"],
  ["Rob","Bishop","R","UT",1,"@reprobbishop"],
  ["Sanford","Bishop","D","GA",2,"@SanfordBishop"],
  ["Diane","Black","R","TN",6,"@RepDianeBlack"],
  ["Marsha","Blackburn","R","TN",7,"@MarshaBlackburn"],
  ["Rod","Blum","R","IA",1,"@RepRodBlum"],
  ["Earl","Blumenauer","D","OR",3,"@blumenauermedia"],
  ["John","Boehner","R","OH",8,"@SpeakerBoehner"],
  ["Suzanne","Bonamici","D","OR",1,"@RepBonamici"],
  ["Madeleine","Bordallo","D","GU",0,""],
  ["Mike","Bost","R","IL",12,"@RepMikeBost"],
  ["Charles","Boustany","R","LA",3,"@RepBoustany"],
  ["Brendan","Boyle","D","PA",13,"@RepBrendanBoyle"],
  ["Kevin","Brady","R","TX",8,"@RepKevinBrady"],
  ["Robert","Brady","D","PA",1,"@RepBrady"],
  ["Dave","Brat","R","VA",7,"@DaveBratVA7th"],
  ["Jim","Bridenstine","R","OK",1,"@RepJBridenstine"],
  ["Mo","Brooks","R","AL",5,"@RepMoBrooks"],
  ["Susan","Brooks","R","IN",5,"@SusanWBrooks"],
  ["Corrine","Brown","D","FL",5,"@RepCorrineBrown"],
  ["Julia","Brownley","D","CA",26,"@JuliaBrownley"],
  ["Vern","Buchanan","R","FL",16,"@VernBuchanan"],
  ["Ken","Buck","R","CO",4,"@RepKenBuck"],
  ["Larry","Bucshon","R","IN",8,"@RepLarryBucshon"],
  ["Michael","Burgess","R","TX",26,"@michaelcburgess"],
  ["Cheri","Bustos","D","IL",17,"@cheribustos"],
  ["G.","Butterfield","D","NC",1,"@gkbutterfield"],
  ["Bradley","Byrne","R","AL",1,"@RepByrne"],
  ["Ken","Calvert","R","CA",42,"@KenCalvert"],
  ["Lois","Capps","D","CA",24,"@RepLoisCapps"],
  ["Michael","Capuano","D","MA",7,"@mikecapuano"],
  ["Tony","Cárdenas","D","CA",29,"@repcardenas"],
  ["John","Carney","D","DE",0,"@johncarneyde"],
  ["André","Carson","D","IN",7,"@RepAndreCarson"],
  ["Earl","Carter","R","GA",1,"@Carter4Congress"],
  ["John","Carter","R","TX",31,"@JudgeCarter"],
  ["Matt","Cartwright","D","PA",17,"@RepCartwright"],
  ["Kathy","Castor","D","FL",14,"@USRepKCastor"],
  ["Joaquin","Castro","D","TX",20,"@JoaquinCastrotx"],
  ["Steve","Chabot","R","OH",1,"@RepSteveChabot"],
  ["Jason","Chaffetz","R","UT",3,"@jasoninthehouse"],
  ["Judy","Chu","D","CA",27,"@RepJudyChu"],
  ["David","Cicilline","D","RI",1,"@davidcicilline"],
  ["Katherine","Clark","D","MA",5,"@RepKClark"],
  ["Yvette","Clarke","D","NY",9,"@YvetteClarke"],
  ["Curt","Clawson","R","FL",19,"@RepCurtClawson"],
  ["Wm.","Clay","D","MO",1,"@LacyClayMO1"],
  ["Emanuel","Cleaver","D","MO",5,"@repcleaver"],
  ["James","Clyburn","D","SC",6,"@clyburn"],
  ["Mike","Coffman","R","CO",6,"@RepMikeCoffman"],
  ["Steve","Cohen","D","TN",9,"@repcohen"],
  ["Tom","Cole","R","OK",4,"@tomcoleok04"],
  ["Chris","Collins","R","NY",27,"@RepChrisCollins"],
  ["Doug","Collins","R","GA",9,"@Douglas_Collins"],
  ["Barbara","Comstock","R","VA",10,"@BarbaraComstock"],
  ["K.","Conaway","R","TX",11,"@ConawayTX11"],
  ["Gerald","Connolly","D","VA",11,"@GerryConnolly"],
  ["John","Conyers","D","MI",13,"@repjohnconyers"],
  ["Paul","Cook","R","CA",8,"@RepPaulCook"],
  ["Jim","Cooper","D","TN",5,"@repjimcooper"],
  ["Jim","Costa","D","CA",16,"@repjimcosta"],
  ["Ryan","Costello","R","PA",6,"@RyanACostello"],
  ["Joe","Courtney","D","CT",2,"@repjoecourtney"],
  ["Kevin","Cramer","R","ND",0,"@RepKevinCramer"],
  ["Eric","Crawford","R","AR",1,"@RepRickCrawford"],
  ["Ander","Crenshaw","R","FL",4,"@AnderCrenshaw"],
  ["Joseph","Crowley","D","NY",14,"@repjoecrowley"],
  ["Henry","Cuellar","D","TX",28,"@RepCuellar"],
  ["John","Culberson","R","TX",7,"@congculberson"],
  ["Elijah","Cummings","D","MD",7,"@RepCummings"],
  ["Carlos","Curbelo","R","FL",26,"@carloslcurbelo"],
  ["Danny","Davis","D","IL",7,"@RepDannyDavis"],
  ["Rodney","Davis","R","IL",13,"@RodneyDavis"],
  ["Susan","Davis","D","CA",53,"@RepSusanDavis"],
  ["Peter","DeFazio","D","OR",4,"@RepPeterDeFazio"],
  ["Diana","DeGette","D","CO",1,"@RepDianaDeGette"],
  ["John","Delaney","D","MD",6,"@RepJohnDelaney"],
  ["Rosa","DeLauro","D","CT",3,"@rosadelauro"],
  ["Suzan","DelBene","D","WA",1,"@SuzanDelBene"],
  ["Jeff","Denham","R","CA",10,"@RepJeffDenham"],
  ["Charles","Dent","R","PA",15,"@DentforCongress"],
  ["Ron","DeSantis","R","FL",6,"@RepDeSantis"],
  ["Mark","DeSaulnier","D","CA",11,"@MarkDeSaulnier"],
  ["Scott","DesJarlais","R","TN",4,"@DesJarlaisTN04"],
  ["Theodore","Deutch","D","FL",21,"@repteddeutch"],
  ["Mario","Diaz-Balart","R","FL",25,"@MarioDB"],
  ["Debbie","Dingell","D","MI",12,"@DebDingell"],
  ["Lloyd","Doggett","D","TX",35,"@RepLloydDoggett"],
  ["Robert","Dold","R","IL",10,"@RepDold"],
  ["Michael","Doyle","D","PA",14,"@USRepMikeDoyle"],
  ["Tammy","Duckworth","D","IL",8,"@repduckworth"],
  ["Sean","Duffy","R","WI",7,"@RepSeanDuffy"],
  ["Jeff","Duncan","R","SC",3,"@RepJeffDuncan"],
  ["John","Duncan","R","TN",2,"@RepJohnDuncanJr"],
  ["Donna","Edwards","D","MD",4,"@repdonnaedwards"],
  ["Keith","Ellison","D","MN",5,"@keithellison"],
  ["Renee","Ellmers","R","NC",2,"@RepReneeEllmers"],
  ["Tom","Emmer","R","MN",6,"@tomemmer"],
  ["Eliot","Engel","D","NY",16,"@RepEliotEngel"],
  ["Anna","Eshoo","D","CA",18,"@RepAnnaEshoo"],
  ["Elizabeth","Esty","D","CT",5,"@Elizabeth_Esty"],
  ["Blake","Farenthold","R","TX",27,"@farenthold"],
  ["Sam","Farr","D","CA",20,"@RepSamFarr"],
  ["Chaka","Fattah","D","PA",2,"@chakafattah"],
  ["Stephen","Fincher","R","TN",8,"@RepFincherTN08"],
  ["Michael","Fitzpatrick","R","PA",8,"@RepFitzpatrick"],
  ["Charles","Fleischmann","R","TN",3,"@RepChuck"],
  ["John","Fleming","R","LA",4,"@RepFleming"],
  ["Bill","Flores","R","TX",17,"@Flores4Congress"],
  ["J.","Forbes","R","VA",4,"@Randy_Forbes"],
  ["Jeff","Fortenberry","R","NE",1,"@JeffFortenberry"],
  ["Bill","Foster","D","IL",11,"@RepBillFoster"],
  ["Virginia","Foxx","R","NC",5,"@virginiafoxx"],
  ["Lois","Frankel","D","FL",22,"@LoisFrankel"],
  ["Trent","Franks","R","AZ",8,"@RepTrentFranks"],
  ["Rodney","Frelinghuysen","R","NJ",11,"@RodneyforNJ"],
  ["Marcia","Fudge","D","OH",11,"@marciafudge"],
  ["Tulsi","Gabbard","D","HI",2,"@TulsiGabbard"],
  ["Ruben","Gallego","D","AZ",7,"@RubenGallego"],
  ["John","Garamendi","D","CA",3,"@RepGaramendi"],
  ["Scott","Garrett","R","NJ",5,"@repgarrett"],
  ["Bob","Gibbs","R","OH",7,"@RepBobGibbs"],
  ["Christopher","Gibson","R","NY",19,"@RepChrisGibson"],
  ["Louie","Gohmert","R","TX",1,"@replouiegohmert"],
  ["Bob","Goodlatte","R","VA",6,"@RepGoodlatte"],
  ["Paul","Gosar","R","AZ",4,"@RepGosar"],
  ["Trey","Gowdy","R","SC",4,"@TGowdySC"],
  ["Gwen","Graham","D","FL",2,"@RepGwenGraham"],
  ["Kay","Granger","R","TX",12,"@RepKayGranger"],
  ["Garret","Graves","R","LA",6,"@garretgraves"],
  ["Sam","Graves","R","MO",6,"@SmallBizGOP"],
  ["Tom","Graves","R","GA",14,"@reptomgraves"],
  ["Alan","Grayson","D","FL",9,"@AlanGrayson"],
  ["Al","Green","D","TX",9,"@RepAlGreen"],
  ["Gene","Green","D","TX",29,"@RepGeneGreen"],
  ["H.","Griffith","R","VA",9,"@RepMGriffith"],
  ["Raúl","Grijalva","D","AZ",3,"@repraulgrijalva"],
  ["Glenn","Grothman","R","WI",6,"@grothmanforwi"],
  ["Frank","Guinta","R","NH",1,"@frankguinta"],
  ["Brett","Guthrie","R","KY",2,"@repguthrie"],
  ["Luis","Gutiérrez","D","IL",4,"@repgutierrez"],
  ["Janice","Hahn","D","CA",44,"@Rep_JaniceHahn"],
  ["Richard","Hanna","R","NY",22,"@RepRichardHanna"],
  ["Cresent","Hardy","R","NV",4,"@cresenthardy"],
  ["Gregg","Harper","R","MS",3,"@GreggHarper"],
  ["Andy","Harris","R","MD",1,"@Harris4Congress"],
  ["Vicky","Hartzler","R","MO",4,"@RepHartzler"],
  ["Alcee","Hastings","D","FL",20,"@RepHastingsFL"],
  ["Denny","Heck","D","WA",10,"@DennyHeck"],
  ["Joseph","Heck","R","NV",3,"@RepJoeHeck"],
  ["Jeb","Hensarling","R","TX",5,"@RepHensarling"],
  ["Jaime","Herrera Beutler","R","WA",3,"@herrerabeutler"],
  ["Jody","Hice","R","GA",10,"@jodyhice"],
  ["Brian","Higgins","D","NY",26,"@RepBrianHiggins"],
  ["J.","Hill","R","AR",2,"@ElectFrench"],
  ["James","Himes","D","CT",4,"@jahimes"],
  ["Rubén","Hinojosa","D","TX",15,"@USRepRHinojosa"],
  ["George","Holding","R","NC",13,"@GeorgeHolding"],
  ["Michael","Honda","D","CA",17,"@RepMikeHonda"],
  ["Steny","Hoyer","D","MD",5,"@WhipHoyer"],
  ["Richard","Hudson","R","NC",8,"@RichHudson"],
  ["Tim","Huelskamp","R","KS",1,"@conghuelskamp"],
  ["Jared","Huffman","D","CA",2,"@JaredHuffman"],
  ["Bill","Huizenga","R","MI",2,"@rephuizenga"],
  ["Randy","Hultgren","R","IL",14,"@rephultgren"],
  ["Duncan","Hunter","R","CA",50,"@Rep_Hunter"],
  ["Will","Hurd","R","TX",23,"@HurdOnTheHill"],
  ["Robert","Hurt","R","VA",5,"@RepRobertHurt"],
  ["Steve","Israel","D","NY",3,"@RepSteveIsrael"],
  ["Darrell","Issa","R","CA",49,"@DarrellIssa"],
  ["Sheila","Jackson Lee","D","TX",18,"@JacksonLeeTX18"],
  ["Hakeem","Jeffries","D","NY",8,"@RepJeffries"],
  ["Evan","Jenkins","R","WV",3,"@evanjenkinswv"],
  ["Lynn","Jenkins","R","KS",2,"@RepLynnJenkins"],
  ["Bill","Johnson","R","OH",6,"@repbilljohnson"],
  ["Eddie","Johnson","D","TX",30,"@RepEBJ"],
  ["Henry","Johnson","D","GA",4,"@RepHankJohnson"],
  ["Sam","Johnson","R","TX",3,"@SamsPressShop"],
  ["David","Jolly","R","FL",13,"@USRepDavidJolly"],
  ["Walter","Jones","R","NC",3,"@RepWalterJones"],
  ["Jim","Jordan","R","OH",4,"@Jim_Jordan"],
  ["David","Joyce","R","OH",14,"@DaveJoyceOH14"],
  ["Marcy","Kaptur","D","OH",9,"@RepMarcyKaptur"],
  ["John","Katko","R","NY",24,""],
  ["William","Keating","D","MA",9,"@USRep_Keating"],
  ["Mike","Kelly","R","PA",3,"@MikeKellyforPA3"],
  ["Robin","Kelly","D","IL",2,"@RepRobinKelly"],
  ["Joseph","Kennedy","D","MA",4,"@joekennedy"],
  ["Daniel","Kildee","D","MI",5,"@dankildee"],
  ["Derek","Kilmer","D","WA",6,"@DerekKilmer"],
  ["Ron","Kind","D","WI",3,"@repronkind"],
  ["Peter","King","R","NY",2,"@RepPeteKing"],
  ["Steve","King","R","IA",4,"@stevekingia"],
  ["Adam","Kinzinger","R","IL",16,"@RepKinzinger"],
  ["Ann","Kirkpatrick","D","AZ",1,"@RepKirkpatrick"],
  ["John","Kline","R","MN",2,"@repjohnkline"],
  ["Stephen","Knight","R","CA",25,"@stephentknight"],
  ["Ann","Kuster","D","NH",2,"@AnnMcLaneKuster"],
  ["Raúl","Labrador","R","ID",1,"@Raul_Labrador"],
  ["Doug","LaMalfa","R","CA",1,"@DougLaMalfa"],
  ["Doug","Lamborn","R","CO",5,"@RepDLamborn"],
  ["Leonard","Lance","R","NJ",7,"@RepLanceNJ7"],
  ["James","Langevin","D","RI",2,"@jimlangevin"],
  ["Rick","Larsen","D","WA",2,"@larsenrick"],
  ["John","Larson","D","CT",1,"@repjohnlarson"],
  ["Robert","Latta","R","OH",5,"@boblatta"],
  ["Brenda","Lawrence","D","MI",14,"@BrendaLLawrence"],
  ["Barbara","Lee","D","CA",13,"@RepBarbaraLee"],
  ["Sander","Levin","D","MI",9,"@repsandylevin"],
  ["John","Lewis","D","GA",5,"@RepJohnLewis"],
  ["Ted","Lieu","D","CA",33,"@tedlieu"],
  ["Daniel","Lipinski","D","IL",3,"@replipinski"],
  ["Frank","LoBiondo","R","NJ",2,"@RepLoBiondo"],
  ["David","Loebsack","D","IA",2,"@daveloebsack"],
  ["Zoe","Lofgren","D","CA",19,"@RepZoeLofgren"],
  ["Billy","Long","R","MO",7,"@BillyLongMO7"],
  ["Barry","Loudermilk","R","GA",11,"@reploudermilk"],
  ["Mia","Love","R","UT",4,"@miablove"],
  ["Alan","Lowenthal","D","CA",47,"@alanlowenthal"],
  ["Nita","Lowey","D","NY",17,"@NitaLowey"],
  ["Frank","Lucas","R","OK",3,"@RepFrankLucas"],
  ["Blaine","Luetkemeyer","R","MO",3,"@repblainepress"],
  ["Ben","Luján","D","NM",3,"@repbenraylujan"],
  ["Michelle","Lujan Grisham","D","NM",1,"@replujangrisham"],
  ["Cynthia","Lummis","R","WY",0,"@CynthiaLummis"],
  ["Stephen","Lynch","D","MA",8,"@RepStephenLynch"],
  ["Thomas","MacArthur","R","NJ",3,"@reptommacarthur"],
  ["Carolyn","Maloney","D","NY",12,"@RepMaloney"],
  ["Sean","Maloney","D","NY",18,"@spmaloney"],
  ["Kenny","Marchant","R","TX",24,"@RepKenMarchant"],
  ["Tom","Marino","R","PA",10,"@RepTomMarino"],
  ["Thomas","Massie","R","KY",4,"@ThomasMassieKY"],
  ["Doris","Matsui","D","CA",6,"@DorisMatsui"],
  ["Kevin","McCarthy","R","CA",23,"@GOPWhip"],
  ["Michael","McCaul","R","TX",10,"@McCaulPressShop"],
  ["Tom","McClintock","R","CA",4,"@RepMcClintock"],
  ["Betty","McCollum","D","MN",4,"@BettyMcCollum04"],
  ["Jim","McDermott","D","WA",7,"@RepJimMcDermott"],
  ["James","McGovern","D","MA",2,"@RepMcGovern"],
  ["Patrick","McHenry","R","NC",10,"@PatrickMcHenry"],
  ["David","McKinley","R","WV",1,"@RepMcKinley"],
  ["Cathy","McMorris Rodgers","R","WA",5,"@cathymcmorris"],
  ["Jerry","McNerney","D","CA",9,"@jerrymcnerney"],
  ["Martha","McSally","R","AZ",2,"@marthamcsally"],
  ["Mark","Meadows","R","NC",11,"@RepMarkMeadows"],
  ["Patrick","Meehan","R","PA",7,"@repmeehan"],
  ["Gregory","Meeks","D","NY",5,"@GregoryMeeks"],
  ["Grace","Meng","D","NY",6,"@RepGraceMeng"],
  ["Luke","Messer","R","IN",6,"@Luke_Messer"],
  ["John","Mica","R","FL",7,"@micaforcongress"],
  ["Candice","Miller","R","MI",10,"@CandiceMiller"],
  ["Jeff","Miller","R","FL",1,"@CongJeffMiller"],
  ["John","Moolenaar","R","MI",4,"@johnmoolenaar"],
  ["Alexander","Mooney","R","WV",2,"@MooneyforWV"],
  ["Gwen","Moore","D","WI",4,"@RepGwenMoore"],
  ["Seth","Moulton","D","MA",6,"@sethmoulton"],
  ["Markwayne","Mullin","R","OK",2,"@RepMullin"],
  ["Mick","Mulvaney","R","SC",5,"@RepMickMulvaney"],
  ["Patrick","Murphy","D","FL",18,"@RepMurphyFL"],
  ["Tim","Murphy","R","PA",18,"@RepTimMurphy"],
  ["Jerrold","Nadler","D","NY",10,"@RepJerryNadler"],
  ["Grace","Napolitano","D","CA",32,"@gracenapolitano"],
  ["Richard","Neal","D","MA",1,"@RepRichardNeal"],
  ["Randy","Neugebauer","R","TX",19,"@RandyNeugebauer"],
  ["Dan","Newhouse","R","WA",4,""],
  ["Kristi","Noem","R","SD",0,"@RepKristiNoem"],
  ["Richard","Nolan","D","MN",8,"@usrepricknolan"],
  ["Donald","Norcross","D","NJ",1,"@donnorcross4nj"],
  ["Eleanor","Norton","D","DC",0,"@EleanorNorton"],
  ["Richard","Nugent","R","FL",11,"@RepRichNugent"],
  ["Devin","Nunes","R","CA",22,"@devinnunes"],
  ["Alan","Nunnelee","R","MS",1,"@RepAlanNunnelee"],
  ["Vacant","Office of the Eleventh Congressional District of New York","","NY",11,""],
  ["Pete","Olson","R","TX",22,"@OlsonPressShop"],
  ["Beto","ORourke","D","TX",16,"@betoorourke"],
  ["Steven","Palazzo","R","MS",4,"@CongPalazzo"],
  ["Frank","Pallone","D","NJ",6,"@FrankPallone"],
  ["Gary","Palmer","R","AL",6,"@Palmer4Alabama"],
  ["Bill","Pascrell","D","NJ",9,"@BillPascrell"],
  ["Erik","Paulsen","R","MN",3,"@RepErikPaulsen"],
  ["Donald","Payne","D","NJ",10,"@RepDonaldPayne"],
  ["Stevan","Pearce","R","NM",2,"@RepStevePearce"],
  ["Nancy","Pelosi","D","CA",12,"@NancyPelosi"],
  ["Ed","Perlmutter","D","CO",7,"@RepPerlmutter"],
  ["Scott","Perry","R","PA",4,"@RepScottPerry"],
  ["Scott","Peters","D","CA",52,"@RepScottPeters"],
  ["Collin","Peterson","D","MN",7,"@collinpeterson"],
  ["Pedro","Pierluisi","D","PR",0,"@pedropierluisi"],
  ["Chellie","Pingree","D","ME",1,"@chelliepingree"],
  ["Robert","Pittenger","R","NC",9,"@RobertPittenger"],
  ["Joseph","Pitts","R","PA",16,"@RepJoePitts"],
  ["Stacey","Plaskett","D","VI",0,"@staceyplaskett"],
  ["Mark","Pocan","D","WI",2,"@repmarkpocan"],
  ["Ted","Poe","R","TX",2,"@JudgeTedPoe"],
  ["Bruce","Poliquin","R","ME",2,"@brucepoliquin"],
  ["Jared","Polis","D","CO",2,"@jaredpolis"],
  ["Mike","Pompeo","R","KS",4,"@repmikepompeo"],
  ["Bill","Posey","R","FL",8,"@congbillposey"],
  ["David","Price","D","NC",4,"@RepDavidEPrice"],
  ["Tom","Price","R","GA",6,"@RepTomPrice"],
  ["Mike","Quigley","D","IL",5,"@RepMikeQuigley"],
  ["Amata","Radewagen","R","AQ",0,""],
  ["Charles","Rangel","D","NY",13,"@cbrangel"],
  ["John","Ratcliffe","R","TX",4,"@ratcliffetx4"],
  ["Tom","Reed","R","NY",23,"@RepTomReed"],
  ["David","Reichert","R","WA",8,"@davereichert"],
  ["James","Renacci","R","OH",16,"@repjimrenacci"],
  ["Reid","Ribble","R","WI",8,"@RepRibble"],
  ["Kathleen","Rice","D","NY",4,"@KathleenRice"],
  ["Tom","Rice","R","SC",7,"@TomRiceSC7"],
  ["Cedric","Richmond","D","LA",2,"@RepRichmond"],
  ["E.","Rigell","R","VA",2,"@repscottrigell"],
  ["Martha","Roby","R","AL",2,"@RepMarthaRoby"],
  ["David","Roe","R","TN",1,"@DrPhilRoe"],
  ["Harold","Rogers","R","KY",5,"@RepHalRogers"],
  ["Mike","Rogers","R","AL",3,"@RepMikeRogersAL"],
  ["Dana","Rohrabacher","R","CA",48,"@DanaRohrabacher"],
  ["Todd","Rokita","R","IN",4,"@ToddRokita"],
  ["Thomas","Rooney","R","FL",17,"@TomRooney"],
  ["Peter","Roskam","R","IL",6,"@PeterRoskam"],
  ["Ileana","Ros-Lehtinen","R","FL",27,"@RosLehtinen"],
  ["Dennis","Ross","R","FL",15,"@RepDennisRoss"],
  ["Keith","Rothfus","R","PA",12,"@KeithRothfus"],
  ["David","Rouzer","R","NC",7,"@davidrouzer"],
  ["Lucille","Roybal-Allard","D","CA",40,"@RepRoybalAllard"],
  ["Edward","Royce","R","CA",39,"@RepEdRoyce"],
  ["Raul","Ruiz","D","CA",36,"@CongressmanRuiz"],
  ["C.","Ruppersberger","D","MD",2,"@Call_Me_Dutch"],
  ["Bobby","Rush","D","IL",1,"@RepBobbyRush"],
  ["Steve","Russell","R","OK",5,"@steverussellok"],
  ["Paul","Ryan","R","WI",1,"@reppaulryan"],
  ["Tim","Ryan","D","OH",13,"@timryan"],
  ["Gregorio","Sablan","D","MP",0,""],
  ["Matt","Salmon","R","AZ",5,"@RepMattSalmon"],
  ["Loretta","Sanchez","D","CA",46,"@lorettasanchez"],
  ["Linda","Sánchez","D","CA",38,"@RepLindaSanchez"],
  ["Mark","Sanford","R","SC",1,"@RepSanfordSC"],
  ["John","Sarbanes","D","MD",3,"@RepJohnSarbanes"],
  ["Steve","Scalise","R","LA",1,"@SteveScalise"],
  ["Janice","Schakowsky","D","IL",9,"@janschakowsky"],
  ["Adam","Schiff","D","CA",28,"@RepAdamSchiff"],
  ["Aaron","Schock","R","IL",18,"@repaaronschock"],
  ["Kurt","Schrader","D","OR",5,"@repschrader"],
  ["David","Schweikert","R","AZ",6,"@RepDavid"],
  ["Austin","Scott","R","GA",8,"@AustinScottGA08"],
  ["David","Scott","D","GA",13,"@repdavidscott"],
  ["Robert","Scott","D","VA",3,"@repbobbyscott"],
  ["F.","Sensenbrenner","R","WI",5,"@JimPressOffice"],
  ["José","Serrano","D","NY",15,"@repjoseserrano"],
  ["Pete","Sessions","R","TX",32,"@petesessions"],
  ["Terri","Sewell","D","AL",7,"@Sewell4Congress"],
  ["Brad","Sherman","D","CA",30,"@BradSherman"],
  ["John","Shimkus","R","IL",15,"@RepShimkus"],
  ["Bill","Shuster","R","PA",9,"@RepBillShuster"],
  ["Michael","Simpson","R","ID",2,"@CongMikeSimpson"],
  ["Kyrsten","Sinema","D","AZ",9,"@kyrstensinema"],
  ["Albio","Sires","D","NJ",8,"@Rep_Albio_Sires"],
  ["Louise","Slaughter","D","NY",25,"@louiseslaughter"],
  ["Adam","Smith","D","WA",9,"@Rep_Adam_Smith"],
  ["Adrian","Smith","R","NE",3,"@RepAdrianSmith"],
  ["Christopher","Smith","R","NJ",4,"@RepChrisSmith"],
  ["Jason","Smith","R","MO",8,"@RepJasonSmith"],
  ["Lamar","Smith","R","TX",21,"@LamarSmithTX21"],
  ["Jackie","Speier","D","CA",14,"@repspeier"],
  ["Elise","Stefanik","R","NY",21,"@elisestefanik"],
  ["Chris","Stewart","R","UT",2,"@ChrisStewart4UT"],
  ["Steve","Stivers","R","OH",15,"@RepSteveStivers"],
  ["Marlin","Stutzman","R","IN",3,"@marlinstutzman"],
  ["Eric","Swalwell","D","CA",15,"@repswalwell"],
  ["Mark","Takai","D","HI",1,"@marktakai"],
  ["Mark","Takano","D","CA",41,"@MarkTakano"],
  ["Bennie","Thompson","D","MS",2,"@BennieGThompson"],
  ["Glenn","Thompson","R","PA",5,"@CongressmanGT"],
  ["Mike","Thompson","D","CA",5,"@RepThompson"],
  ["Mac","Thornberry","R","TX",13,"@MacTXPress"],
  ["Patrick","Tiberi","R","OH",12,"@TeamTiberi"],
  ["Scott","Tipton","R","CO",3,"@RepTipton"],
  ["Dina","Titus","D","NV",1,"@repdinatitus"],
  ["Paul","Tonko","D","NY",20,"@PaulTonko"],
  ["Norma","Torres","D","CA",35,"@normajtorres"],
  ["David","Trott","R","MI",11,"@trott4congress"],
  ["Niki","Tsongas","D","MA",3,"@ntsongas"],
  ["Michael","Turner","R","OH",10,"@RepMikeTurner"],
  ["Fred","Upton","R","MI",6,"@RepFredUpton"],
  ["David","Valadao","R","CA",21,"@dgvaladao"],
  ["Chris","Van Hollen","D","MD",8,"@chrisvanhollen"],
  ["Juan","Vargas","D","CA",51,"@RepJuanVargas"],
  ["Marc","Veasey","D","TX",33,"@MarcVeasey"],
  ["Filemon","Vela","D","TX",34,"@FilemonVela"],
  ["Nydia","Velázquez","D","NY",7,"@NydiaVelazquez"],
  ["Peter","Visclosky","D","IN",1,"@repvisclosky"],
  ["Ann","Wagner","R","MO",2,"@RepAnnWagner"],
  ["Tim","Walberg","R","MI",7,"@RepWalberg"],
  ["Greg","Walden","R","OR",2,"@repgregwalden"],
  ["Mark","Walker","R","NC",6,"@walker4nc"],
  ["Jackie","Walorski","R","IN",2,"@jackiewalorski"],
  ["Mimi","Walters","R","CA",45,"@mimiwaltersca"],
  ["Timothy","Walz","D","MN",1,"@Reptimwalz"],
  ["Debbie","Wasserman Schultz","D","FL",23,"@DWStweets"],
  ["Maxine","Waters","D","CA",43,"@MaxineWaters"],
  ["Bonnie","Watson Coleman","D","NJ",12,"@bwatsoncoleman"],
  ["Randy","Weber","R","TX",14,"@TXRandy14"],
  ["Daniel","Webster","R","FL",10,"@RepWebster"],
  ["Peter","Welch","D","VT",0,"@PeterWelch"],
  ["Brad","Wenstrup","R","OH",2,"@bradwenstrup"],
  ["Bruce","Westerman","R","AR",4,"@westermanar"],
  ["Lynn","Westmoreland","R","GA",3,"@repwestmoreland"],
  ["Ed","Whitfield","R","KY",1,"@repedwhitfield"],
  ["Roger","Williams","R","TX",25,"@RogerWilliamsTX"],
  ["Frederica","Wilson","D","FL",24,"@RepWilson"],
  ["Joe","Wilson","R","SC",2,"@USRepJoeWilson"],
  ["Robert","Wittman","R","VA",1,"@RobWittman"],
  ["Steve","Womack","R","AR",3,"@Rep_SteveWomack"],
  ["Rob","Woodall","R","GA",7,""],
  ["John","Yarmuth","D","KY",3,"@RepJohnYarmuth"],
  ["Kevin","Yoder","R","KS",3,"@RepKevinYoder"],
  ["Ted","Yoho","R","FL",3,"@TedYoho"],
  ["David","Young","R","IA",3,"@repdavidyoung"],
  ["Don","Young","R","AK",0,"@RepDonYoung"],
  ["Todd","Young","R","IN",9,"@RepToddYoung"],
  ["Lee","Zeldin","R","NY",1,"@leezeldin"],
  ["Ryan","Zinke","R","MT",0,"@ryanzinke"]
]

representatives.each do |first_name, last_name, party, state, district, twitter_handle|
  CongressMember.create( first_name: first_name, last_name: last_name, party: party, state: state, district: district, twitter_handle: twitter_handle, type_by_house: "Representative")
end

senators = [
  ["Lamar","Alexander","R","TN","@senalexander"],
  ["Kelly","Ayotte","R","NH","@KellyAyotte"],
  ["Tammy","Baldwin","D","WI","@SenatorBaldwin"],
  ["John","Barrasso","R","WY","@senjohnbarrasso"],
  ["Mark","Begich","D","AK","@SenatorBegich"],
  ["Michael F.","Bennet","D","CO","@senbennetco"],
  ["Richard","Blumenthal","D","CT","@SenBlumenthal"],
  ["Roy","Blunt","R","MO","@RoyBlunt "],
  ["Cory A.","Booker","D","NJ","@corybooker"],
  ["John","Boozman","R","AR","@JohnBoozman"],
  ["Barbara","Boxer","D","CA","@senatorboxer"],
  ["Sherrod","Brown","D","OH","@sensherrodbrown"],
  ["Richard","Burr","R","NC","@senatorburr"],
  ["Maria","Cantwell","D","WA","@CantwellPress"],
  ["Benjamin L.","Cardin","D","MD","@SenatorCardin"],
  ["Thomas R.","Carper","D","DE","@senatorcarper"],
  ["Robert P., Jr.","Casey","D","PA","@SenBobCasey"],
  ["Saxby","Chambliss","R","GA","@SaxbyChambliss"],
  ["Daniel","Coats","R","IN","@SenDanCoats"],
  ["Tom","Coburn","R","OK","@TomCoburn"],
  ["Thad","Cochran","R","MS","@SenThadCochran"],
  ["Susan M.","Collins","R","ME","@senatorcollins"],
  ["Christopher A.","Coons","D","DE","@chriscoons"],
  ["Bob","Corker","R","TN","@SenBobCorker"],
  ["John","Cornyn","R","TX","@JohnCornyn"],
  ["Mike","Crapo","R","ID","@MikeCrapo"],
  ["Ted","Cruz","R","TX","@SenTedCruz"],
  ["Joe","Donnelly","D","IN","@SenDonnelly"],
  ["Richard J.","Durbin","D","IL","@SenatorDurbin"],
  ["Michael B.","Enzi","R","WY","@SenatorEnzi"],
  ["Dianne","Feinstein","D","CA","@SenFeinstein"],
  ["Deb","Fischer","R","NE","@SenatorFischer"],
  ["Jeff","Flake","R","AZ","@jeffflake"],
  ["Al","Franken","D","MN","@alfranken"],
  ["Kirsten E.","Gillibrand","D","NY","@sengillibrand"],
  ["Lindsey","Graham","R","SC","@GrahamBlog"],
  ["Chuck","Grassley","R","IA","@chuckgrassley "],
  ["Kay R.","Hagan","D","NC","@SenatorHagan"],
  ["Tom","Harkin","D","IA","@SenatorHarkin"],
  ["Orrin G.","Hatch","R","UT","@SenOrrinHatch"],
  ["Martin","Heinrich","D","NM","@martinheinrich"],
  ["Heidi","Heitkamp","D","ND","@SenatorHeitkamp"],
  ["Dean","Heller","R","NV","@sendeanheller"],
  ["Mazie K.","Hirono","D","HI","@maziehirono"],
  ["John","Hoeven","R","ND","@SenJohnHoeven"],
  ["James M.","Inhofe","R","OK","@InhofePress"],
  ["Johnny","Isakson","R","GA","@SenatorIsakson"],
  ["Mike","Johanns","R","NE","@Mike_Johanns"],
  ["Ron","Johnson","R","WI","@SenRonJohnson"],
  ["Tim","Johnson","D","SD","@SenJohnsonSD"],
  ["Tim","Kaine","D","VA","@SenKaineOffice"],
  ["Angus S., Jr.","King","I","ME","@SenAngusKing"],
  ["Mark","Kirk","R","IL","@senatorkirk"],
  ["Amy","Klobuchar","D","MN","@amyklobuchar"],
  ["Mary L.","Landrieu","D","LA","@SenLandrieu"],
  ["Patrick J.","Leahy","D","VT","@SenatorLeahy"],
  ["Mike","Lee","R","UT","@SenMikeLee"],
  ["Carl","Levin","D","MI","@sencarllevin"],
  ["Joe, III","Manchin","D","WV","@Sen_JoeManchin"],
  ["Edward J.","Markey","D","MA","@markeymemo"],
  ["John","McCain","R","AZ","@senjohnmccain"],
  ["Claire","McCaskill","D","MO","@clairecmc"],
  ["Mitch","McConnell","R","KY","@McConnellPress"],
  ["Robert","Menendez","D","NJ","@SenatorMenendez"],
  ["Jeff","Merkley","D","OR","@SenJeffMerkley"],
  ["Barbara A.","Mikulski","D","MD","@SenatorBarb"],
  ["Jerry","Moran","R","KS","@jerrymoran"],
  ["Lisa","Murkowski","R","AK","@lisamurkowski"],
  ["Christopher","Murphy","D","CT","@ChrisMurphyCT"],
  ["Patty","Murray","D","WA","@PattyMurray"],
  ["Bill","Nelson","D","FL","@senbillnelson"],
  ["Rand","Paul","R","KY","@SenRandPaul"],
  ["Rob","Portman","R","OH","@robportman"],
  ["Mark L.","Pryor","D","AR","@senmarkpryor"],
  ["Jack","Reed","D","RI","@SenJackReed"],
  ["Harry","Reid","D","NV","@SenatorReid"],
  ["James E.","Risch","R","ID","@SenatorRisch"],
  ["Pat","Roberts","R","KS","@senpatroberts"],
  ["John D., IV","Rockefeller","D","WV","@SenRockefeller"],
  ["Marco","Rubio","R","FL","@SenRubioPress"],
  ["Bernard","Sanders","I","VT","@SenSanders"],
  ["Brian","Schatz","D","HI","@SenBrianSchatz"],
  ["Charles E.","Schumer","D","NY","@SenSchumer"],
  ["Tim","Scott","R","SC","@SenatorTimScott"],
  ["Jeff","Sessions","R","AL","@senatorsessions"],
  ["Jeanne","Shaheen","D","NH","@jeanneshaheen"],
  ["Richard C.","Shelby","R","AL","@SenShelby"],
  ["Debbie","Stabenow","D","MI","@SenStabenow"],
  ["Jon","Tester","D","MT","@SenatorTester"],
  ["John","Thune","R","SD","@SenJohnThune"],
  ["Patrick J.","Toomey","R","PA","@sentoomey"],
  ["Mark","Udall","D","CO","@MarkUdall"],
  ["Tom","Udall","D","NM","@SenatorTomUdall"],
  ["David","Vitter","R","LA","@davidvitter"],
  ["John E.","Walsh","D","MT","@SenWalshOffice"],
  ["Mark R.","Warner","D","VA","@MarkWarner"],
  ["Elizabeth","Warren","D","MA","@senwarren"],
  ["Sheldon","Whitehouse","D","RI","@senwhitehouse"],
  ["Roger F.","Wicker","R","MS","@SenatorWicker"],
  ["Ron","Wyden","D","OR","@RonWyden"],
  ["Shelley Moore","Capito","R","WV","@CapitoforWV"],
  ["Bill","Cassidy","R","LA","@BillCassidy"],
  ["Tom","Cotton","R","AR","@TomCottonAR"],
  ["Steve","Daines","R","MT","@SteveDaines"],
  ["Joni","Ernst","R","IA","@joniernst"],
  ["Cory","Gardner","R","CO","@CoryGardner"],
  ["James","Lankford","R","OK","@jameslankford"],
  ["David","Perdue","R","GA","@Perduesenate"],
  ["Gary","Peters","D","MI","@Peters4Michigan"],
  ["Mike","Rounds","R","SD","@SenatorRounds"],
  ["Ben","Sasse","R","NE","@SenSasse"],
  ["Daniel","Sullivan","R","AK","@SenDanSullivan"],
  ["Thom","Tillis","R","NC","@ThomTillis"]
]

senators.each do |first_name, last_name, party, state, twitter_handle|
  CongressMember.create( first_name: first_name, last_name: last_name, party: party, state: state, twitter_handle: twitter_handle, type_by_house: "Senator")
end