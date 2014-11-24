require_relative 'customer_entry'

class CustomerRespository

  def initialize(customers)
    customers ||= customers.map {|customer| Customer.new(customer)}
  end

end
