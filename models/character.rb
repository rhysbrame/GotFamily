require_relative('../db/sql_runner')

class Character

  attr_reader :id, :firstname, :surname, :gender, :portrait, :house_id, :mother_id, :father_id, :religion_id

  def initialize (options)
    @id = nil || options['id'].to_i
    @firstname = options['firstname']
    @surname = options['surname']
    @gender = options['gender']
    @portrait = options['portrait']
    @house_id = options['house_id']? options['house_id'].to_i : 'null'
    @mother_id = options['mother_id']? options['mother_id'].to_i : 'null'
    @father_id = options['father_id']? options['father_id'].to_i : 'null'
    @religion_id = options['religion_id']? options['religion_id'].to_i : 'null'
  end

  def save
    sql = "INSERT INTO characters (firstname, surname, gender, portrait, house_id, mother_id, father_id, religion_id ) VALUES ('#{@firstname}', '#{@surname}', '#{@gender}', '#{@portrait}', #{@house_id}, #{@mother_id}, #{@father_id}, #{@religion_id} ) RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE characters SET (firstname, surname, gender, portrait, house_id, mother_id, father_id, religion_id ) = ('#{@firstname}', '#{@surname}', '#{@gender}', '#{@portrait}', '#{@house_id}', #{@mother_id}, #{@father_id}, #{@religion_id} ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = #{@house_id}"
    house = House.map_item(sql)
    return house
  end

  def parent(id)
    sql = "SELECT * FROM characters WHERE id = #{id}"
    character = Character.map_item(sql)
    return character
  end

  def religion
    sql = "SELECT * FROM religions WHERE id = #{@religion_id}"
    religion = Religion.map_item(sql)
    return religion
  end

  def children
    sql = "SELECT * FROM characters WHERE mother_id = #{@id} OR father_id = #{@id}"
    characters = Character.map_items(sql)
    return characters 
  end

  def siblings
    sql = "SELECT * FROM characters WHERE mother_id = #{@mother_id} OR father_id = #{@father_id} EXCEPT SELECT * FROM characters WHERE id = #{@id}"
    characters = Character.map_items(sql)
    return characters
  end

  def self.all()
    sql = "SELECT * FROM characters ORDER BY surname ASC, firstname ASC"
    characters = Character.map_items(sql)
    return characters 
  end

  def self.find(find_id)
    sql = "SELECT * FROM characters WHERE id = #{find_id}"
    character = Character.map_item(sql)
    return character
  end

  def self.delete_all
    sql = "DELETE FROM characters"
    SqlRunner.run(sql)
  end

  #Helper methods for mapping
  def self.map_items(sql)
    characters = SqlRunner.run(sql)
    results = characters.map {|character| Character.new(character) }
    return results
  end

  def self.map_item(sql)
    results = Character.map_items(sql)
    return results.first()
  end

end