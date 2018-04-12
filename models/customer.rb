require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :id
  attr_accessor :name, :wallet

def initialize(options)

  @id = options['id'].to_i
  @name = options['name']
  @wallet = options['wallet'].to_i

end

def save()
  sql = "INSERT INTO customers (name, wallet) VALUES ($1, $2) RETURNING id;"
  values = [@name, @wallet]
  customer = SqlRunner.run(sql, values).first
  @id = customer['id'].to_i

end



end
