require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')
require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({"name" => "Daniel Childs", "funds" => 100})
customer2 = Customer.new({"name" => "Wiktoria Potocka", "funds" => 50})
customer3 = Customer.new({"name" => "Nick Jones", "funds" => 20})
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({'title' => 'Pulp Fiction', 'price' => 3})
film2 = Film.new({'title' => 'Up', 'price' => 3})
film3 = Film.new({'title' => 'Happy Feet', 'price' => 3})
film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, "film_id" => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, "film_id" => film2.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, "film_id" => film3.id})
ticket4 = Ticket.new({'customer_id' => customer1.id, "film_id" => film1.id})
ticket5 = Ticket.new({'customer_id' => customer2.id, "film_id" => film2.id})
ticket6 = Ticket.new({'customer_id' => customer3.id, "film_id" => film3.id})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()

binding.pry
nil
