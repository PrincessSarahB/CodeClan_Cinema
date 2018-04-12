require_relative('../db/sql_runner.rb')

class Film
attr_reader :id
attr_accessor :title, :price
def initialize(options)
  @id = options['id'].to_i
  @title = options['title']
  @price = options['price'].to_i

end


def save()
  sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
  values = [@title, @price]
  film = SqlRunner.run(sql, values).first
  @id = film['id'].to_i

end

def self.all()
  sql = "SELECT * FROM films"
  values = []
  films = SqlRunner.run(sql, values)
  result = Film.map_films(films)
  return result
end




def self.map_films(film_data)

return film_data.map {|film| Film.new(film)}

end
end
