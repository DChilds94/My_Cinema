require_relative('../db/sql_runner.rb')
require_relative('./films')
require_relative('./customers')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options["id"].to_i
    @customer_id = options["customer_id"].to_i
    @film_id = options["film_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def self.map_tickets(ticket_data)
    return ticket_data.map {|ticket| Ticket.new(ticket)}
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket = SqlRunner.run(sql)
    result = Ticket.map_tickets(ticket)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3;"
    values = [@customer_i, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first()
    return Customer.new(customer)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1;"
    values = [@film_id]
    film = SqlRunner.run(sql, values)
    return Film.map_films(film)
  end

  # def self.ticket_count
  #   sql = "SELECT * FROM tickets WHERE customer_id = $1;"
  #   values = [@customer_id]
  #   ticket_count = SqlRunner.run(sql, values)
  #   return ticket_count.map  {|ticket_count| Ticket_count.new(ticket_count)}
  # end

# |ticket| Ticket.new(ticket)}

def self.customer_tickets()
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [@id]
  customer = SqlRunner.run(sql, values).first()
  return Customer.new(customer)
end


end
