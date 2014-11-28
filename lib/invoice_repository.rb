require_relative 'invoice'
require_relative 'office_repository'

class InvoiceRepository < OfficeRepository

  attr_reader :data, :sales_engine

  def initialize(invoice, filename, parent)
    @data ||= invoice.map {|invoice| Invoice.new(invoice, self)}
    @sales_engine = parent
  end

  def find_by_customer_id(criteria)
    generic_non_string_find("customer_id", criteria)
  end

  def find_by_merchant_id(criteria)
    generic_non_string_find("merchant_id", criteria)
  end

  def find_by_status(criteria)
    generic_find("status", criteria)
  end

  def find_all_by_customer_id(criteria)
    generic_non_string_find_all("customer_id", criteria)
  end

  def find_all_by_merchant_id(criteria)
    generic_non_string_find_all("merchant_id", criteria)
  end

  def find_all_by_status(criteria)
    generic_find_all("status", criteria)
  end

  def find_customer_from(id)
    sales_engine.find_customer_from(id)
  end

  def find_invoice_items_from(id)
    sales_engine.find_invoice_items_from_invoice(id)
  end

  def find_items_from(id)
    sales_engine.find_items_from_invoice(id)
  end

  def find_merchant_from(id)
    sales_engine.find_merchant_from(id)
  end

  def find_transactions_from(id)
    sales_engine.find_transactions_from_invoice(id)
  end
end
