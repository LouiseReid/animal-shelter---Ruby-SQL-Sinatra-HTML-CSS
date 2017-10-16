require_relative '../db/sql_runner'

class Animal

  attr_reader :id
  attr_accessor :name, :picture, :arrival_date, :status, :type, :breed, :info

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @picture = options['picture']
    @arrival_date = options['arrival_date']
    @status = convert_to_boolean(options['status'])
    @type = options['type']
    @breed = options['breed']
    @info = options['info']
  end


  def save()
    sql = "INSERT INTO animals(name, picture, arrival_date, status, type, breed, info)
    VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    values = [@name, @picture, @arrival_date, @status, @type, @breed, @info]
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
    sql = "UPDATE animals SET(name, picture, arrival_date, status, type, breed, info)
    = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8;"
    values = [@name, @picture, @arrival_date, @status, @type, @breed, @info, @id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1;"
    values = [id]
    animal = SqlRunner.run(sql, values)
    result = Animal.new(animal.first)
    return result
  end

  def self.find_by_type(type)
    sql = "SELECT * FROM animals WHERE LOWER(type) = $1;"
    values = [type.downcase]
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

  def convert_to_boolean(status)
    return true if status == 't' || status == true
    return false
  end

  def change_status()
    @status = !@status
    update()
  end



end
