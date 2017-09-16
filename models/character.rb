require_relative('../db/sql_runner')

class Character

  attr_reader :id, :firstname, :surname, :gender, :house_id, :mother_id, :father_id

  def initialize (options)
    @id = nil || options['id'].to_i
    @firstname = options['firstname']
    @surname = options['surname']
    @gender = options['gender']
    @house_id = options['house_id'].to_i
    @mother_id = options['mother_id']? options['mother_id'].to_i : 'null'
    @father_id = options['father_id']? options['father_id'].to_i : 'null'
    @religion_id = options['religion_id']? options['religion_id'].to_i : 'null'
  end

  def save
    sql = "INSERT INTO characters (firstname, surname, gender, house_id, mother_id, father_id, religion_id ) VALUES ('#{@firstname}', '#{@surname}', '#{@gender}', #{@house_id}, #{@mother_id}, #{@father_id}, #{@religion_id} ) RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE characters SET (firstname, surname, gender, house_id, mother_id, father_id, religion_id ) = ('#{@firstname}', '#{@surname}', '#{@gender}', '#{@house_id}', #{@mother_id}, #{@father_id}, #{@religion_id} ) WHERE id = #{@id}"
    SqlRunner.run(sql)
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