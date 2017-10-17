require_relative '../db/sql_runner'

class Owner

  attr_reader :id
  attr_accessor :name, :contact, :cleared

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
    @cleared = convert_to_boolean(options['cleared'])
  end

  def save()
    sql = "INSERT INTO owners(name, contact, cleared)
    VALUES($1, $2, $3) RETURNING id;"
    values = [@name, @contact, @cleared]
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
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [id]
    owner = SqlRunner.run(sql, values)
    result = Owner.new(owner.first)
    return result
  end

  def update()
    sql = "UPDATE owners SET(name, contact, cleared)
    = ($1, $2, $3) WHERE id = $4;"
    values = [@name, @contact, @cleared, @id]
    SqlRunner.run(sql, values)
  end

  def self.cleared()
    sql = "SELECT * FROM owners WHERE cleared = true;"
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map { |owner| Owner.new(owner)  }
    return result
  end

  def self.not_cleared()
    sql = "SELECT * FROM owners WHERE cleared = false;"
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map { |owner| Owner.new(owner)  }
    return result
  end

  def convert_to_boolean(cleared)
    return true if cleared == 't' || cleared == true
    return false
  end

  def change_status()
    @cleared = !@cleared
    update()
  end


end
