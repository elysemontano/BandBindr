user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

organization1 = user1.organizations.create(name: "Org 1")
organization2 = user1.organizations.create(name: "Org 2")
organization3 = user2.organizations.create(name: "Org 3")
organization4 = user2.organizations.create(name: "Org 4")

people = [
  {
    organization_id: 1,
    first_name: 'Elizabeth',
    last_name: 'Mountain'
  },{
    organization_id: 1,
    first_name:'Ashley',
    last_name:'Park'
  },{
    organization_id: 1,
    first_name:'Danielle',
    last_name:'Woods'
  },{
    organization_id: 1,
    first_name:'David',
    last_name:'Coast'
  }
]

people.each do |person|
  Person.create! person
  puts "creating person: #{person}"
end

songs = [
  {
    organization_id: 1,
    song_name:'Perfected',
  },{
    organization_id: 1,
    song_name:'What A Beautiful Name',
  },{
    organization_id: 1,
    song_name:'Every Victory',
  },{
    organization_id: 1,
    song_name:'The Glory is Yours',
  },{
    organization_id: 1,
    song_name:'Sing To You',
  },{
    organization_id: 1,
    song_name:'Here With You',
  },{
    organization_id: 1,
    song_name:'No Longer Slaves',
  },
]

songs.each do |song|
  Song.create! song
  puts "creating song: #{song}"
end

keys = [
  {
    song_key:'D',
    person_id:1,
    song_id:1
  },{
    song_key:'G',
    person_id:3,
    song_id:2
  },{
    song_key:'F',
    person_id:1,
    song_id:2
  },{
    song_key:'D',
    person_id:2,
    song_id:1
  },{
    song_key:'E',
    person_id:1,
    song_id:3
  },{
    song_key:'C',
    person_id:1,
    song_id:4
  },{
    song_key:'Bb',
    person_id:2,
    song_id:4
  },{
    song_key:'E',
    person_id:1,
    song_id:5
  },{
    song_key:'E',
    person_id:4,
    song_id:5
  },{
    song_key:'A',
    person_id:1,
    song_id:6
  },{
    song_key:'A',
    person_id:4,
    song_id:6
  },{
    song_key:'A',
    person_id:2,
    song_id:6
  },{
    song_key:'C',
    person_id:1,
    song_id:7
  },{
    song_key:'B',
    person_id:2,
    song_id:7
  }
]

keys.each do |key|
  Key.create! key
  puts "creating key: #{key}"
end

tags = [
  {
    tag_word:'original',
    organization_id: 1,
  },{
    tag_word:'fear',
    organization_id: 1,
  },{
    tag_word:'beautiful',
    organization_id: 1,
  },{
    tag_word:'victory',
    organization_id: 1,
  },{
    tag_word:'love',
    organization_id: 1,
  },{
    tag_word:'surrender',
    organization_id: 1,
  },{
    tag_word:'upbeat',
    organization_id: 1,
  },

]

tags.each do |tag|
  Tag.create! tag
  puts "creating tag: #{tag}"
end

song_tags = [
  {
    tag_id:1,
    song_id:1
  },{
    tag_id:1,
    song_id:5
  },{
    tag_id:1,
    song_id:6
  },{
    tag_id:2,
    song_id:7
  },{
    tag_id:3,
    song_id:2
  },{
    tag_id:3,
    song_id:6
  },{
    tag_id:4,
    song_id:3
  },{
    tag_id:4,
    song_id:4
  },{
    tag_id:5,
    song_id:2
  },{
    tag_id:5,
    song_id:6
  },{
    tag_id:6,
    song_id:1
  },{
    tag_id:6,
    song_id:6
  },{
    tag_id:7,
    song_id:4
  },{
    tag_id:7,
    song_id:5
  },

]

song_tags.each do |song_tags|
  SongTag.create! song_tags
  puts "creating song_tag: #{song_tags}"
end