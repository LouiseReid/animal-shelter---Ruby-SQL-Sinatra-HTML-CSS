require ('minitest/autorun')
require ('minitest/rg')
require_relative ('./animal')

class AnimalTest < MiniTest::Test

  def setup()
    @animal = Animal.new({
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
  end

  def test_animal_name()
    assert_equal('Fergus', @animal.name)
  end

  def test_animal_status()
    assert(true, @animal.status)
  end

  def test_change_status()
    assert_equal(false, @animal.change_status)
  end

end
