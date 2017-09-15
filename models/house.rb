require_relative('../db/sql_runner')

class House

  attr_reader :id, :name

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO houses (name) VALUES ('#{@name}') RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE houses SET (name) = ('#{@name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM houses ORDER BY name ASC"
    houses = House.map_items(sql)
    return houses
  end

  def self.find(find_id)
    sql = "SELECT * FROM houses WHERE id = #{find_id}"
    house = House.map_item(sql)
    return house
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

# Helper methods for maping
  def self.map_items(sql)
    houses = SqlRunner.run(sql)
    results = houses.map {|house| House.new(house)}
    return results
  end

  def self.map_item(sql)
    results = House.map_items(sql)
    return results.first() 
  end
end