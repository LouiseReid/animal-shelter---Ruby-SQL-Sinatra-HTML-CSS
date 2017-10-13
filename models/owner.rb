require_relative '../db/sql_runner'

class Owner

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @animal_id = options['animal_id'].to_i
  end

  def save()
    sql = "INSERT INTO owners(name, animal_id)
    VALUES($1, $2) RETURNING id;"
    values = [@name, @animal_id]
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

end
