cats = [
  {
    name: 'Felix',
    age: 2,
    enjoys: 'long naps on the couch and a warm fire'
  },
  {
    name: 'Garfield',
    age: 1000,
    enjoys: 'lounging, eating lasgana'
  }
]

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes} "
end
