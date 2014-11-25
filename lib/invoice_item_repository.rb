require_relative 'invoice_item'
require_relative 'office_repository'

class InvoiceItemRepository < OfficeRepository

  def initialize(invoice_items)
    @data ||= invoice_items.map {|invoice_item| InvoiceItem.new(invoice_item)}
  end

  def find_by_item_id(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_invoice_id(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_quantity(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_unit_price(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_all_by_item_id(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_unit_price(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_invoice_id(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_quantity(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end
end
