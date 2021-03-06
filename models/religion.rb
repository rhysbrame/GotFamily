require_relative('../db/sql_runner')

class Religion

  attr_reader :id, :name, :symbol

  def initialize (options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @symbol = options['symbol']
  end

  def save
    sql = "INSERT INTO religions (name, symbol) VALUES ('#{@name}', '#{@symbol}') RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE religions SET (name, symbol) = ('#{@name}', '#{@symbol}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def houses
    sql = "SELECT * FROM houses WHERE religion_id = #{@id}"
    houses = House.map_items(sql)
    return houses
  end

  def characters
      sql = "SELECT * FROM characters WHERE religion_id = #{@id}"
      characters = Character.map_items(sql)
      return characters 
  end

  def self.all()
    sql = "SELECT * FROM religions ORDER BY name ASC"
    religions = Religion.map_items(sql)
    return religions
  end

  def self.find(find_id)
    sql = "SELECT * FROM religions WHERE id = #{find_id}"
    religion = Religion.map_item(sql)
    return religion
  end

  def self.delete_all
    sql = "DELETE FROM religions"
    SqlRunner.run(sql)
  end

# Helper methods for maping

  def self.map_items(sql)
    religions = SqlRunner.run(sql)
    results = religions.map {|religion| Religion.new(religion)}
    return results
  end

  def self.map_item(sql)
    results = Religion.map_items(sql)
    return results.first()
  end

end