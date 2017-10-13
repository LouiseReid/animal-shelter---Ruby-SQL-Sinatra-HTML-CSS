require_relative '../models/animal'
require_relative '../models/owner'

require 'pry-byebug'

Owner.delete_all()
Animal.delete_all()


animal1 = Animal.new({
  'name' => 'Fergus',
  'picture' => '/domesticlonghair.jpeg',
  'arrival_date' => '12/10/2017',
  'status' => true,
  'type' => 'Cat',
  'breed' => 'Domestic Long-hair'
  })

  animal1.save()

animal2 = Animal.new({
  'name' => 'Gary',
  'picture' => '/bordercollie.jpeg',
  'arrival_date' => '1/10/2017',
  'status' => false,
  'type' => 'Dog',
  'breed' => 'Border Collie'
  })

  animal2.save()

animal3 = Animal.new({
  'name' => 'Maggie',
  'picture' => '/mainecoon.jpeg',
  'arrival_date' => '10/10/2017',
  'status' => true,
  'type' => 'Cat',
  'breed' => 'Maine Coon'
  })

  animal3.save()

animal4 = Animal.new({
  'name' => 'Bob',
  'picture' => '/germanshepherd.jpeg',
  'arrival_date' => '2/10/2017',
  'status' => false,
  'type' => 'Dog',
  'breed' => 'German Shepherd'
  })

  animal4.save()

animal5 = Animal.new({
  'name' => 'Maisey',
  'picture' => '/domesticshorthair.jpeg',
  'arrival_date' => '2/10/2017',
  'status' => true,
  'type' => 'Cat',
  'breed' => 'Domestic Short-hair'
  })

  animal5.save()

animal6 = Animal.new({
  'name' => 'Spot',
  'picture' => '/dalmatian.jpeg',
  'arrival_date' => '2/10/2017',
  'status' => false,
  'type' => 'Dog',
  'breed' => 'Dalmatian'
  })

  animal6.save()

owner1 = Owner.new({'name' => 'Mrs Brown', 'animal_id' => animal2.id, 'contact' => '07773004567'})

  owner1.save()

owner2 = Owner.new({'name' => 'Mr Cassidy', 'animal_id' => animal4.id, 'contact' => '07780001234'})

  owner2.save()

owner3 = Owner.new({'name' => 'Mr Clark', 'animal_id' => animal6.id, 'contact' => '07774009375'})

  owner3.save()


binding.pry
nil
