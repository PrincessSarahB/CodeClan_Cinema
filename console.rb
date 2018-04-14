require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()

customer1 = Customer.new({
  'name' => 'Lesley Knope',
  'wallet' => 50.00
  })

  customer1.save()

  customer2 = Customer.new({
    'name' => 'Ronald Ulysees Swanson',
    'wallet' => 10000.00
    })

    customer2.save()

    customer3 = Customer.new({
      'name' => 'April Ludgate-Dwyer',
      'wallet' => 20.00
      })

      customer3.save()

      film1 = Film.new ({
        'title' => 'Bring It On',
        'price' => 5.00
        })
        film1.save()

        film2 = Film.new({
          'title' => 'Django Unchained',
          'price' => 6.00

          })

          film2.save()

          film3 = Film.new({
            'title' => 'The Room',
            'price' => 6.00
            })

            film3.save()

            screening1 = Screening.new({
              'screening_time' => '19:00',
              'film_id' => film1.id

              })

              screening1.save()

              screening2 = Screening.new({
                'screening_time' => '19:50',
                'film_id' => film2.id

                })

                screening2.save()

                screening3 = Screening.new({
                  'screening_time' => '21:30',
                  'film_id' => film1.id

                  })

                  screening3.save()

                  screening4 = Screening.new({
                    'screening_time' => '00:00',
                    'film_id' => film3.id

                    })

                    screening4.save()

            ticket1 = Ticket.new({
              'customer_id' => customer1.id,
              'film_id' => film1.id,
              'screening_id' => screening1.id
              })

              ticket1.save()

              ticket2 = Ticket.new({
                'customer_id' => customer2.id,
                'film_id' => film2.id,
                'screening_id' => screening2.id
                })
                ticket2.save()

                ticket3 = Ticket.new({
                  'customer_id' => customer3.id,
                  'film_id' => film1.id,
                  'screening_id' => screening1.id
                  })
                  ticket3.save()

                  ticket4 = Ticket.new({
                    'customer_id' => customer1.id,
                    'film_id' => film2.id,
                    'screening_id' => screening2.id
                    })
                    ticket4.save()

                    ticket5 = Ticket.new({
                      'customer_id' => customer3.id,
                      'film_id' => film3.id,
                      'screening_id' => screening4.id
                      })

                      ticket5.save()



                              binding.pry
                              nil


                              #customer has ticket, ticket has screening, screening has film
