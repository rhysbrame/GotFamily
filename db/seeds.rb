require_relative( '../models/religion' )
require_relative( '../models/house' )
require_relative( '../models/allegiance' )
require_relative( '../models/character' )

Character.delete_all()
Allegiance.delete_all()
House.delete_all()
Religion.delete_all()

r1 = Religion.new({'name' => 'Old Gods of the Forest'})
r1.save()
r2 = Religion.new({'name' => 'Faith of the Seven'})
r2.save()
r3 = Religion.new({'name' => 'Drowned God'})
r3.save()
r4 = Religion.new({"name" => "R''hllor, the Lord of Light"})
r4.save()


h1 = House.new({
  'name' => 'Stark', 
  'sigil_link' => '/sigils/stark.png', 
  'sigil_script' => 'A grey direwolf on a white field.', 
  'words' => '"Winter Is Coming"', 
  'titles' => 'Lords of Winterfell', 
  'seat' => 'Winterfell', 
  'region' => 'The North', 
  'religion_id' => r1.id 
}) 
h1.save()
h2 = House.new({'name' => 'Targaryen', 'sigil_link' => '/sigils/targaryen.png', 'sigil_script' => 'A red three-headed dragon, on a black field.', 'words' => '"Fire and Blood"', 'titles' => 'Lords of Dragonstone', 'seat' => 'Dragonstone', 'region' => 'Dragonstone', 'religion_id' => r2.id })
h2.save()
h3 = House.new({'name' => 'Lannister', 'sigil_link' => '/sigils/lannister.png', 'sigil_script' => 'A golden lion rampant on a crimson field.', 'words' => '"Hear Me Roar!"', 'titles' => 'Kings of the Andals and the First Men', 'seat' => 'Casterly Rock', 'region' => 'Westerlands', 'religion_id' => r2.id })
h3.save()
h4 = House.new({'name' => 'Greyjoy', 'sigil_link' => '/sigils/greyjoy.png', 'sigil_script' => 'A golden kraken on a black field', 'words' => '"We do not sow"', 'titles' => 'Kings of the Iron Islands', 'seat' => 'Pyke', 'region' => 'Iron Islands', 'religion_id' => r3.id })
h4.save()
h5 = House.new({'name' => 'Baratheon'})
h5.save()
h6 = House.new({'name' => 'Arryn'})
h6.save()
h7 = House.new({'name' => 'Tully'})
h7.save()
h8 = House.new({'name' => 'Casterly'})
h8.save()
h9 = House.new({'name' => 'Mudd'})
h9.save()
h10 = House.new({'name' => 'Justman'})
h10.save()
h11 = House.new({'name' => 'Gardener'})
h11.save()
h12 = House.new({'name' => 'Hoare'})
h12.save()
h13 = House.new({'name' => 'Frey'})
h13.save()
h14 = House.new({'name' => 'Durrandon'})
h14.save()
h15 = House.new({'name' => 'Martell'})
h15.save()
h16 = House.new({'name' => 'Bolton'})
h16.save()
h17 = House.new({'name' => 'Tyrell'})
h17.save()

# Template
# h = House.new({
#   'name' => '', 
#   'sigil_link' => '/sigils/.png', 
#   'sigil_script' => '', 
#   'words' => '', 
#   'titles' => '', 
#   'seat' => '', 
#   'region' => '', 
#   'religion_id' => r.id
# })
# h.save()

all1 = Allegiance.new({'a_id' => h1.id, 'b_id' => h6.id})
all1.save()
all2 = Allegiance.new({'a_id' => h1.id, 'b_id' => h5.id})
all2.save()
all3 = Allegiance.new({'a_id' => h5.id, 'b_id' => h6.id})
all3.save()
all4 = Allegiance.new({'a_id' => h1.id, 'b_id' => h13.id})
all4.save()
all5 = Allegiance.new({'a_id' => h13.id, 'b_id' => h7.id})
all5.save()
all6 = Allegiance.new({'a_id' => h3.id, 'b_id' => h5.id})
all6.save()
all7 = Allegiance.new({'a_id' => h1.id, 'b_id' => h7.id})
all7.save()

# Template
# all = Allegiance.new({'a_id' => h.id, 'b_id' => h.id})
# all.save()

ch1 = Character.new({'firstname' => 'Ned', 'surname' => 'Stark', 'gender' => 'm', 'pic_link' => '/pictures', 'house_id' => h1.id })
ch1.save()
ch2 = Character.new({'firstname' => 'Catelyn', 'surname' => 'Stark', 'gender' => 'f', 'house_id' => h1.id })
ch2.save()
ch3 = Character.new({'firstname' => 'Rob', 'surname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id, 'mother_id' => ch2.id, 'father_id' => ch1.id })
ch3.save()
ch4 = Character.new({'firstname' => 'Bran', 'surname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id, 'mother_id' => ch2.id, 'father_id' => ch1.id })
ch4.save()
ch5 = Character.new({'firstname' => 'Rikon', 'surname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id, 'mother_id' => ch2.id, 'father_id' => ch1.id })
ch5.save()
ch6 = Character.new({'firstname' => 'Arya', 'surname' => 'Stark', 'gender' => 'f', 'house_id' => h1.id, 'mother_id' => ch2.id, 'father_id' => ch1.id })
ch6.save()
ch7 = Character.new({'firstname' => 'Sansa', 'surname' => 'Stark', 'gender' => 'f', 'house_id' => h1.id, 'mother_id' => ch2.id, 'father_id' => ch1.id })
ch7.save()
ch8 = Character.new({'firstname' => 'Jon', 'surname' => 'Snow', 'gender' => 'm', 'house_id' => h1.id, 'father_id' => ch1.id })
ch8.save()
ch9 = Character.new({'firstname' => 'Daenerys', 'surname' => 'Targaryen', 'gender' => 'f', 'house_id' => h2.id })
ch9.save()
ch10 = Character.new({'firstname' => 'Tywin', 'surname' => 'Lannister', 'gender' => 'm', 'house_id' => h3.id })
ch10.save()
ch11 = Character.new({'firstname' => 'Cersei', 'surname' => 'Lannister', 'gender' => 'f', 'house_id' => h3.id, 'father_id' => ch10.id })
ch11.save()
ch12 = Character.new({'firstname' => 'Jamie', 'surname' => 'Lannister', 'gender' => 'm', 'house_id' => h3.id, 'father_id' => ch10.id  })
ch12.save()
ch14 = Character.new({'firstname' => 'Robert', 'surname' => 'Baratheon', 'gender' => 'm', 'house_id' => h5.id })
ch14.save()
ch13 = Character.new({'firstname' => 'Joffrey', 'surname' => 'Lannister', 'gender' => 'm', 'house_id' => h3.id, 'mother_id' => ch11.id, 'father_id' => ch14.id })
ch13.save()
ch15 = Character.new({'firstname' => 'Theon', 'surname' => 'Greyjoy', 'gender' => 'm', 'house_id' => h4.id })
ch15.save()

# Template
# ch1 = Character.new({'firstname' => '', 'surname' => '', 'gender' => '', 'house_id' => h.id, 'mother_id' => ch.id, 'father_id' => ch.id})
# ch1.save()
