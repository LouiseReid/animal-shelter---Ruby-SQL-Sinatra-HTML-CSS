require_relative '../models/animal'
require_relative '../models/owner'

require 'pry-byebug'

Owner.delete_all()
Animal.delete_all()


animal1 = Animal.new({
  'name' => 'Fergus',
  'picture' => 'picture.jpg',
  'arrival_date' => '12/10/2017',
  'status' => true,
  'type' => 'cat',
  'breed' => 'domestic long hair'
  })

  animal1.save()

animal2 = Animal.new({
  'name' => 'Gary',
  'picture' => 'picture.jpg',
  'arrival_date' => '1/10/2017',
  'status' => false,
  'type' => 'dog',
  'breed' => 'border collie'
  })

  animal2.save()

animal3 = Animal.new({
  'name' => 'Maggie',
  'picture' => 'picture.jpg',
  'arrival_date' => '10/10/2017',
  'status' => true,
  'type' => 'cat',
  'breed' => 'maine coon'
  })

  animal3.save()

  owner1 = Owner.new({'name' => 'Mrs Brown', 'animal_id' => animal2.id})

  owner1.save()


binding.pry
nil
