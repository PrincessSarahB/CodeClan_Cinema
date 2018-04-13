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




def self.all
  sql = "SELECT * FROM screenings"
  values = []
  screenings = SqlRunner.run(sql, values)
  result = Screening.map_screening(screenings)
  return result

end

def self.map_screening(screening_data)
return screening_data.map {|screening| Screening.new(screening)}
end

end
