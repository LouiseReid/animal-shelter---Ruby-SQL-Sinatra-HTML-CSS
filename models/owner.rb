require_relative '../db/sql_runner'

class Owner

  attr_reader :id
  attr_accessor :name, :animal_id, :contact

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @animal_id = options['animal_id'].to_i
    @contact = options['contact']
  end

  def save()
    sql = "INSERT INTO owners(name, animal_id, contact)
    VALUES($1, $2, $3) RETURNING id;"
    values = [@name, @animal_id, @contact]
    owner = SqlRunner.run(sql, values).first
    @id = owner['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map { |owner| Owner.new(owner)  }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM owners;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHER id = $1;"
    values = [id]
    owner = SqlRunner.run(sql, values)
    result = owner.map { |owner| Owner.new(owner)  }
    return result
  end

  def self.animal
    sql = "SELECT * FROM animals INNER JOIN owners
    ON owners.animal_id = animals.id;"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal)  }
    return result
  end



end
