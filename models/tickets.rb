# # require_relative('../sql_runner.rb')
# require_relative('./films')
# require_relative('./customers')

class Tickets

  def initialize(options)
    @id = options["id"].to_i
    @customer_id = options["customer_id"].to_i
    @film_id = options["film_id"].to_i
  end

end
