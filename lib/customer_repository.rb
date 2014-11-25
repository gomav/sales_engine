require_relative 'customer'

class CustomerRepository

  def initialize(customers)
    @customers ||= customers.map {|customer| Customer.new(customer)}
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def generic_find(attribute, criteria)
    @customers.select { |customer| customer.send(attribute.to_sym).downcase == criteria.downcase }
  end

  def generic_non_string_find(attribute, criteria)
    @customers.select { |customer| customer.send(attribute.to_sym) == criteria }
  end

  def find_by_last_name(criteria)
    send(:generic_find, "last_name", criteria)
  end

  def find_by_first_name(criteria)
    send(:generic_find, "first_name", criteria)
  end

  def find_by_id(criteria)
    send(:generic_non_string_find, "id", criteria)
  end

  def find_by_created_at(criteria)
    send(:generic_non_string_find, "created_at", criteria)
  end

  def find_by_updated_at(criteria)
    send(:generic_non_string_find, "updated_at", criteria)
  end
end
