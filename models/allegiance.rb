require_relative('../db/sql_runner')

class Allegiance

  attr_reader :id, :a_id, :b_id

  def initialize (options)
    @id = options['id'].to_i
    @a_id = options['a_id'].to_i
    @b_id = options['b_id'].to_i
  end

  def save
    sql = "INSERT INTO allegiances (a_id, b_id) VALUES (#{@a_id}, #{@b_id}) RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE allegiances SET (a_id, b_id) = (#{@a_id}, #{@b_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def houses
    sql = "SELECT * FROM houses WHERE id = #{@a_id} OR id = #{@b_id}"
    houses = House.map_items(sql)
    return houses
  end

  def self.all()
    sql = "SELECT * FROM allegiances"
    allegiances = Allegiance.map_items(sql)
    return allegiances
  end

  def self.find(find_id)
    sql = "SELECT * FROM allegiances WHERE id = #{find_id}"
    allegiance = Allegiance.map_item(sql)
    return allegiance
  end

  def self.delete_all
    sql = "DELETE FROM allegiances"
    SqlRunner.run(sql)
  end

# Helper methods for maping
  def self.map_items(sql)
    allegiances = SqlRunner.run(sql)
    results = allegiances.map {|allegiance| Allegiance.new(allegiance)}
    return results
  end

  def self.map_item(sql)
    results = Allegiance.map_items(sql)
    return results.first() 
  end

end