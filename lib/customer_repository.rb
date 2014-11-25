require_relative 'customer'
require_relative 'office_repository'

class CustomerRepository < OfficeRepository

  def initialize(customers)
    @data ||= customers.map {|customer| Customer.new(customer)}
  end

  def find_by_last_name(criteria)
    generic_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_first_name(criteria)
    generic_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_all_by_last_name(criteria)
    generic_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_first_name(criteria)
    generic_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end
end
