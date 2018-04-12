require_relative("customers.rb")
require_relative("films.rb")
require_relative("tickets.rb")
require("pry.byebug")



customer1 = Customer.new({"name" => "Daniel Childs", "funds" => 100})
customer2 = Customer.new({"name" => "Wiktoria Potocka", "funds" => 50})
customer3 = Customer.new({"name" => "Nick Jones", "funds" => 20})
customer1.save()
# customer2.save()
# customer3.save()

film1 = Film.new({'title' => "Pulp Fiction", 'price' => 3})
film2 = Film.new({'title' => "Up", 'price' => 3})
film3 = Film.new({'title' => "Happy Feet", 'price' => 3})
# film1.save()
# film2.save()
# film3.save()

binding.pry
nil
