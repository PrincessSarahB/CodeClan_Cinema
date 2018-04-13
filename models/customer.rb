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

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, wallet) = ($1, $2) WHERE id = $3;"
    values = [@name, @wallet, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = Film.map_films(films)
  end


  def pay_for_ticket(film)
    if @wallet >= film.price
      @wallet -= film.price
      return true
    else
      return false
    end
  end

  def get_ticket(film)
    if pay_for_ticket(film)
      Ticket.new({
        'customer_id' => @id,
        'film_id' => film.id
        }).save()
      else
        return false
      end
    end

    def number_of_tickets()
      films.count
    end

    def self.all()
      sql = "SELECT * FROM customers"
      values = []
      customers = SqlRunner.run(sql, values)
      result = Customer.map_customers(customers)
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.map_customers(customer_data)

      return customer_data.map {|customer| Customer.new(customer)}

    end
  end
