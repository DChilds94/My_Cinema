require_relative('films.rb')
require_relative('./tickets.rb')
require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.map_customers(customer_data)
    return customer_data.map {|customer| Customer.new(customer)}
  end

    def self.all()
      sql = "SELECT * FROM customers"
      customer = SqlRunner.run(sql)
      result = Customer.map_customers(customer)
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM customers WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
    end

    def film()
      sql = "SELECT films.* FROM films INNER JOIN tickets
       ON films.id = tickets.film_id
       WHERE tickets.customer_id = $1;"
      values = [@id]
      film = SqlRunner.run(sql, values)
      return Film.map_films(film)
    end

    def check_funds(film)
      if funds >= film.price
        return true
      elsec
        return false
      end
    end

    def buy_ticket(film)
      if check_funds(film) == true
        @funds -= film.price
      Ticket.new({"customer_id" => @id, "film_id" => film.id}).save
    end
  end

  def ticket_total
    return film.count
  end



end #end of class
