require_relative '../db/sql_runner'
require_relative './owner'
require_relative './animal'

class Adoption

  attr_reader :id
  attr_accessor :animal_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @animal_id = options['animal_id'].to_i()
    @owner_id = options['owner_id'].to_i()
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id)
    VALUES ($1, $2) RETURNING id;"
    values = [@animal_id, @owner_id]
    adoption = SqlRunner.run(sql, values).first
    @id = adoption['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    adoption = SqlRunner.run(sql, values)
    result = adoption.map { |adopt| Adoption.new(adopt) }
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = $1;"
    values = [id]
    adoption = SqlRunner.run(sql, values)
    result = adoption.map { |adopt| Adoption.new(adopt)  }
    return result
  end





end
