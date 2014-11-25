require_relative 'invoice'
require_relative 'office_repository'

class InvoiceRepository < OfficeRepository

  def initialize(invoice)
    @data ||= invoice.map {|invoice| Invoice.new(invoice)}
  end

  def find_by_customer_id(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_merchant_id(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_status(criteria)
    generic_find( __method__.to_s.split('find_by_')[1], criteria)
  end

  def find_all_by_customer_id(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_merchant_id(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_status(criteria)
    generic_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end
end
