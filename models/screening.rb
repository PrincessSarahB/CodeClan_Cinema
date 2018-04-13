require_relative('../db/sql_runner.rb')

class Screening

def initialize(options)
@id = options['id'].to_i
@screening_time = options['screening_time'].to_i
@film_id = options['film_id'].to_i 
end




end
