require_relative '../models/animal'
require_relative '../models/owner'
require_relative '../models/adoption'

require 'pry-byebug'

Adoption.delete_all
Owner.delete_all()
Animal.delete_all()


animal1 = Animal.new({
  'name' => 'Fergus',
  'picture' => '/domesticlonghair.jpeg',
  'arrival_date' => '12/10/2017',
  'status' => true,
  'type' => 'Cat',
  'breed' => 'Domestic Long-hair',
  'info' => 'Fergus is a 3 year old male who was brought to us after his owner
            passed away.  Needs to be re-homed in an environment where he can go
            outside.  Has never lived with other pets.'
  })

  animal1.save()

animal2 = Animal.new({
  'name' => 'Gary',
  'picture' => '/bordercollie.jpeg',
  'arrival_date' => '1/10/2017',
  'status' => false,
  'type' => 'Dog',
  'breed' => 'Border Collie',
  'info' => 'Gary was born into a litter here and has had all his vacinations. He
            was part of a litter of 6 and was one of the more dominant puppies. He
            interacts well with other dogs in the shelter.'
  })

  animal2.save()

animal3 = Animal.new({
  'name' => 'Maggie',
  'picture' => '/mainecoon.jpeg',
  'arrival_date' => '10/10/2017',
  'status' => true,
  'type' => 'Cat',
  'breed' => 'Maine Coon',
  'info' => 'Maggie was born into a litter here and has had all of her vacinations.
            Any potential adopter must be made aware of the potential size she may
            grow to.'
  })

  animal3.save()

animal4 = Animal.new({
  'name' => 'Bob',
  'picture' => '/germanshepherd.jpeg',
  'arrival_date' => '2/10/2017',
  'status' => false,
  'type' => 'Dog',
  'breed' => 'German Shepherd',
  'info' => 'Bob is a retired Police dog and is looking for his retirement home.
            Despite being quite old he still requires alot of physical and mental
            stimulation.  Would ideally suit an adopter who lives outwith the city.'
  })

  animal4.save()

animal5 = Animal.new({
  'name' => 'Maisey',
  'picture' => '/domesticshorthair.jpeg',
  'arrival_date' => '2/10/2017',
  'status' => true,
  'type' => 'Cat',
  'breed' => 'Domestic Short-hair',
  'info' => 'Maisey was brought to us after her owners allergies made it impossible
            for her to stay at home.  She has lived with children and is very friendly.'
  })

  animal5.save()

animal6 = Animal.new({
  'name' => 'Spot',
  'picture' => '/dalmatian.jpeg',
  'arrival_date' => '2/10/2017',
  'status' => false,
  'type' => 'Dog',
  'breed' => 'Dalmatian',
  'info' => 'Spot was brought to us from the SSPCA.  He hasn\'t had the best start
            to life and is quite timid.  Would ideally be suited with someone who
            has sufficient spare time to continue his training to make him more
            comfortable around other dogs.'
  })

  animal6.save()

owner1 = Owner.new({'name' => 'Mrs Brown', 'contact' => '07773004567', 'cleared' => true})

  owner1.save()

owner2 = Owner.new({'name' => 'Mr Cassidy', 'contact' => '07780001234', 'cleared' => true})

  owner2.save()

owner3 = Owner.new({'name' => 'Mr Clark', 'contact' => '07774009375', 'cleared' => true})

  owner3.save()

owner4 = Owner.new({'name' => 'Alanna Smith', 'contact' => '07774009078', 'cleared' => false})

  owner4.save()


adoption1 = Adoption.new({'animal_id' => animal2.id, 'owner_id' => owner1.id})

  adoption1.save()

adoption2 = Adoption.new({'animal_id' => animal4.id, 'owner_id' => owner2.id})

  adoption2.save()

adoption3 = Adoption.new({'animal_id' => animal6.id, 'owner_id' => owner3.id})

  adoption3.save()

binding.pry
nil
