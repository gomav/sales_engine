require_relative 'invoice'
require_relative 'office_repository'

class InvoiceRepository < OfficeRepository

  def initialize(invoice)
    @data ||= invoice.map {|invoice| Invoice.new(invoice)}
  end
end
