require_relative '../db/sql_runner'

class Animal

  attr_reader :id
  attr_accessor :name, :picture, :arrival_date, :status, :type, :breed

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @picture = options['picture']
    @arrival_date = options['arrival_date']
    @status = options['status']
    @type = options['type']
    @breed = options['breed']
  end

  def save()
    sql = "INSERT INTO animals(name, picture, arrival_date, status, type, breed)
    VALUES($1, $2, $3, $4, $5, $6) RETURNING id;"
    values = [@name, @picture, @arrival_date, @status, @type, @breed]
    animal = SqlRunner.run(sql, values).first
    @id = animal['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal)  }
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE animals SET(name, picture, arrival_date, status, type, breed)
    = ($1, $2, $3, $4, $5, $6) WHERE id = $7;"
    values = [@name, @picture, @arrival_date, @status, @type, @breed, @id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1;"
    values = [id]
    animal = SqlRunner.run(sql, values)
    result = animal.map { |animal| Animal.new(animal)  }
    return result
  end

  def self.find_by_type(type)
    sql = "SELECT * FROM animals WHERE type = $1;"
    values = [type]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal)  }
    return result
  end

  def self.adopted()
    sql = "SELECT * FROM animals WHERE status = false;"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal)  }
    return result
  end

  def self.available()
    sql = "SELECT * FROM animals WHERE status = true;"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal)  }
    return result
  end

  def change_status()
    if @status == false
      @status = true
    elsif @status == true
      @status = false
    end
    update()
  end

  

end
