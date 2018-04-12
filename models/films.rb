require_relative("../sql_runner")
require_relative("customers.rb")
require_relative("tickets.tb")

class films

  attr_reader :id
  attr_accessor :title :price

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @price = options["price"].to_i
  end

end
