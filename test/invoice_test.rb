require_relative '../lib/invoice'
require_relative 'test_helper'

class InvoiceTest < Minitest::Test

  def test_invoice_attributes
    data = {
      id: 45,
      customer_id: 34696,
      merchant_id: 955,
      status: "valid",
      created_at: "2010-01-01",
      updated_at: "2015-01-01"
    }
    invoice = Invoice.new(data)

    assert_equal 45, invoice.id
    assert_equal 34696, invoice.customer_id
    assert_equal 955, invoice.merchant_id
    assert_equal "valid", invoice.status
    assert_equal "2010-01-01", invoice.created_at
    assert_equal "2015-01-01", invoice.updated_at
  end
end
