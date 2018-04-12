require_relative('films.rb')
require_relative('tickets.rb')
require_relative('../sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUE ($1, $2) RETURNING id"
    values [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end 
end
