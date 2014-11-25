require_relative 'invoice_item'
require_relative 'office_repository'

class InvoiceItemRepository < OfficeRepository

  def initialize(invoice_items)
    @data ||= invoice_items.map {|invoice_item| InvoiceItem.new(invoice_item)}
  end
end
