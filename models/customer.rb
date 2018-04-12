require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :id
  attr_accessor :name, :wallet

def initialize(options)

  @id = options['id'].to_i
  @name = options['name']
  @wallet = options['wallet'].to_i

end
