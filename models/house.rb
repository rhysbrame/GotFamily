require_relative('../db/sql_runner')

class House

  attr_reader :name, :allegiance

  def initialize (options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @allegiance = options['allegiance']
  end

  def save
    sql = "INSERT INTO houses (name, allegiance) VALUES ('#{@name}','#{@allegiance}') RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE houses SET (name, allegiance) = ('#{@name}', '#{@allegiance}') WHERE id = #{@id}"
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

# Helper methods for maping
  def self.map_items(sql)
    houses = SqlRunner.run(sql)
    results = houses.map {|house| House.new(house)}
    return results
  end

  def self.map_item(sql)
    results = Houses.map_items(sql)
    retrun results.first() 
  end

end





























