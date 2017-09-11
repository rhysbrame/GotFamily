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

end