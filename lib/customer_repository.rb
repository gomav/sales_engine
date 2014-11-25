require_relative 'customer'
require_relative 'office_repository'

class CustomerRepository < OfficeRepository

  def initialize(customers)
    @data ||= customers.map {|customer| Customer.new(customer)}
  end
end
