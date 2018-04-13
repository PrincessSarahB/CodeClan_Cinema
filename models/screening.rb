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


end
