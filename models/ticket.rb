require_relative('../db/sql_runner.rb')

class Ticket

attr_reader :id, :customer_id, :film_id

def initialize(options)
@id = options['id'].to_i
@customer_id = options['customer_id'].to_i
@film_id = options['film_id'].to_i
end

def save()
  sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
  values = [@customer_id, @film_id]
  ticket = SqlRunner.run(sql, values).first
  @id = ticket['id'].to_i

end

def self.all()
  sql = "SELECT * FROM tickets"
  values = []
  tickets = SqlRunner.run(sql, values)
  result = Ticket.map_tickets(tickets)
  return result
end




def self.map_tickets(ticket_data)

return ticket_data.map {|ticket| Ticket.new(ticket)}

end
end
