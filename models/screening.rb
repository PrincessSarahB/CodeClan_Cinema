require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :screening_time, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @screening_time = options['screening_time']
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (screening_time, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@screening_time, @film_id]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE screenings SET (screening_time, film_id) = ($1, $2) WHERE id = $3;"
    values = [@screening_time, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.most_tickets_sold()
    sql = "SELECT * FROM tickets ORDER BY tickets.screening_id;"
    tickets_sold = SqlRunner.run(sql)
    sales = Ticket.map_tickets(tickets_sold)
    count_sales = Hash.new(0)
    for ticket in sales
      count_sales[ticket.screening_id]+=1
    end
    result = count_sales.max_by{|key, value| value}
    return result
  end


  def self.all
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = Screening.map_screening(screenings)
    return result

  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.map_screening(screening_data)
    return screening_data.map {|screening| Screening.new(screening)}
  end

end
