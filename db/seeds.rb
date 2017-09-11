require_relative( '../models/character' )
require_relative( '../models/house' )

Houses.delete_all()
Characters.delete_all()

h1 = Genre.new({'name' => 'Stark', 'allegiance_id' => h5.id}) 
h1.save()

h2 = Genre.new({'name' => 'Targaryen'})
h2.save()

h3 = Genre.new({'name' => 'Lannister'})
h3.save()

h4 = Genre.new({'name' => 'Karstark', 'allegiance_id' => h1.id})
h4.save()

h5 = Genre.new({'name' => 'Baratheon'})
h5.save()


ch1 = Character.new({'fname' => 'Ned','sname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id,'mother_id' => '','father_id' => ''})
ch1.save()

ch2 = Character.new({'fname' => 'Catelyn', 'sname' => 'Stark', 'gender' => 'f', 'house_id' => h1.id})
ch2.save()

ch3 = Character.new({'fname' => 'Rob', 'sname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id, 'mother_id' => ch2.id,'father_id' => ch1.id})
ch3.save()

ch4 = Character.new({'fname' => 'Bran', 'sname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id, 'mother_id' => ch2.id,'father_id' => ch1.id})
ch4.save()

ch5 = Character.new({'fname' => 'Rikon', 'sname' => 'Stark', 'gender' => 'm', 'house_id' => h1.id, 'mother_id' => ch2.id,'father_id' => ch1.id})
ch5.save()

ch6 = Character.new({'fname' => 'Arya', 'sname' => 'Stark', 'gender' => 'f', 'house_id' => h1.id, 'mother_id' => ch2.id,'father_id' => ch1.id})
ch6.save()

ch7 = Character.new({'fname' => 'Sansa', 'sname' => 'Stark', 'gender' => 'f', 'house_id' => h1.id, 'mother_id' => ch2.id,'father_id' => ch1.id})
ch7.save()

ch8 = Character.new({'fname' => 'Jon', 'sname' => 'Snow', 'gender' => 'm', 'house_id' => h1.id,'father_id' => ch1.id})
ch8.save()

ch9 = Character.new({'fname' => 'Daenerys', 'sname' => 'Targaryen', 'gender' => 'f', 'house_id' => h2.id})
ch9.save()

ch10 = Character.new({'fname' => 'Tywin', 'sname' => 'Lannister', 'gender' => 'm', 'house_id' => h3.id})
ch10.save()

ch11 = Character.new({'fname' => 'Cersei', 'sname' => 'Lannister', 'gender' => 'f', 'house_id' => h3.id, 'father_id' => ch10.id})
ch11.save()

ch12 = Character.new({'fname' => 'Jamie', 'sname' => 'Lannister', 'gender' => 'm', 'house_id' => h3.id, 'father_id' => ch11.id})
ch12.save()

ch13 = Character.new({'fname' => 'Joffrey', 'sname' => 'Lannister', 'gender' => 'm', 'house_id' => h3.id, 'mother_id' => ch11.id, 'father_id' => ch14.id})
ch13.save()

ch14 = Character.new({'fname' => 'Robert', 'sname' => 'Baratheon', 'gender' => 'm', 'house_id' => h5.id})
ch14.save()

ch15 = Character.new({'fname' => 'Rickard', 'sname' => 'Stark', 'gender' => 'm', 'house_id' => h4.id})
ch15.save()

# Template
# ch1 = Character.new({'fname' => '', 'sname' => '', 'gender' => '', 'house_id' => h.id, 'mother_id' => ch.id, 'father_id' => ch.id})
# ch1.save()

