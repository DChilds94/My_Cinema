# # require_relative("../db/sql_runner.rb")
# require_relative("./customers.rb")
# require_relative("./tickets.tb")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @price = options["price"].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    films = SqlRunner.run(sql, values).first
    @id = films['id'].to_i
  end

  def self.map_films(film_data)
    return film_data.map {|film| Film.new(film)}
  end

  def self.all()
    sql = "SELECT * FROM films"
    film = SqlRunner.run(sql)
    result = Film.map_films(film)
    return result
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

end
