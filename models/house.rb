require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :sigil_link, :sigil_script, :words, :titles, :seat, :region, :religion_id

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @sigil_link = options['sigil_link']
    @sigil_script = options['sigil_script']
    @words = options['words']
    @titles = options['titles']
    @seat = options['seat']
    @region = options['region']
    @religion_id = options['religion_id']? options['religion_id'].to_i : 'null'
  end

  def save
    sql = "INSERT INTO houses (name, sigil_link, sigil_script, words, titles, seat, region, religion_id) VALUES ('#{@name}', '#{@sigil_link}', '#{@sigil_script}', '#{@words}', '#{@titles}', '#{@seat}', '#{@region}', #{@religion_id}) RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE houses SET (name, sigil_link, sigil_script, words, titles, seat, region, religion_id) = ('#{@name}', '#{@sigil_link}', '#{@sigil_script}', '#{@words}', '#{@titles}', '#{@seat}', '#{@region}', #{@religion_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def religion
    sql = "SELECT * FROM religions WHERE id = #{@religion_id}"
    religion = Religion.map_item(sql)
    return religion
  end

  def characters
    sql = "SELECT * FROM characters WHERE house_id = #{@id}"
    characters = Character.map_items(sql)
    return characters 
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