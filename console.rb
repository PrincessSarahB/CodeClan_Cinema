require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')

customer1 = Customer.new({
  'name' => 'Lesley Knope',
  'wallet' => 50
  })

  customer1.save()

customer2 = Customer.new({
    'name' => 'Ronald Ulysees Swanson',
    'wallet' => 10000
    })

customer2.save()

customer3 = Customer.new({
  'name' => 'April Ludgate-Dwyer',
  'wallet' => 20
  })

  customer3.save()


binding.pry
nil
