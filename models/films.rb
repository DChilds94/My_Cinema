# # require_relative("../sql_runner.rb")
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

end
