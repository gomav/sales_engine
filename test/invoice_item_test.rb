require_relative '../lib/invoice_item'
require_relative 'test_helper'

class InvoiceItemTest < Minitest::Test

  attr_reader :parent, :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, :invoice_item

  def setup
    data = {
      id: "45",
      item_id: "34696",
      invoice_id: "955",
      quantity: "2",
      unit_price: "3.15",
      created_at: "2010-01-01",
      updated_at: "2015-01-01"
    }
    @parent = Minitest::Mock.new
    @invoice_item = InvoiceItem.new(data, parent)
  end

  def test_invoice_item_attributes
    assert_equal "45", invoice_item.id
    assert_equal "34696", invoice_item.item_id
    assert_equal "955", invoice_item.invoice_id
    assert_equal "2", invoice_item.quantity
    assert_equal "3.15", invoice_item.unit_price
    assert_equal "2010-01-01", invoice_item.created_at
    assert_equal "2015-01-01", invoice_item.updated_at
  end
end
