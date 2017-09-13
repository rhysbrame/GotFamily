require_relative('../db/sql_runner')

class Allegiance

  attr_reader :id, :houseA_id, :houseB_id

  def initialize (options)
    @id = options['id'].to_i,
    @houseA_id = options['houseA_id'].to_i
    @houseB_id = options['houseB_id'].to_i
  end

  def save
    sql = "INSERT INTO allegiances (houseA_id, houseB_id) VALUES (#{@houseA_id}, #{@houseB_id}) RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE allegiances SET (houseA_id, houseB_id) = (#{@houseA_id}, #{@houseB_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM allegiances"
    houses = House.map_items(sql)
    return houses
  end

  def self.find(find_id)
    sql = "SELECT * FROM houses WHERE id = #{find_id}"
    house = House.map_item(sql)
    return house
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