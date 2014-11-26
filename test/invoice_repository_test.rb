require_relative '../lib/invoice_repository'
require_relative 'test_helper'

class InvoiceRepoTest < Minitest::Test

  attr_reader :data, :invoice_repo

  def setup
    @data = [{id: "1", customer_id: "539", merchant_id: "1", status: "shipped", created_at:"2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"},
      {id: "2", customer_id: "528", merchant_id: "1", status: "shipped",  created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"},
      {id: "3", customer_id: "523", merchant_id: "1", status: "shipped", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}
    ]
    @invoice_repo = InvoiceRepository.new(data, "filename")
  end

  def test_returns_all
    assert_equal data.length, invoice_repo.all.length
  end

  def test_random
    assert_equal Invoice, invoice_repo.random.class
  end

  def test_find_all_by_id
    invoices = invoice_repo.find_all_by_id("1")
    invoices1 = invoice_repo.find_all_by_id("45")
    assert_equal 1, invoices.size
    assert_equal 0, invoices1.size
  end

  def test_find_all_by_merchant_id
    invoices = invoice_repo.find_all_by_merchant_id("1")
    assert_equal 3, invoices.size
  end

  def test_find_all_by_customer_id
    invoices = invoice_repo.find_all_by_customer_id("539")
    assert_equal 1, invoices.size
  end

  def test_find_all_by_status
    invoices = invoice_repo.find_all_by_status("shipped")
    invoices1 = invoice_repo.find_all_by_status("not shipped")
    assert_equal 3, invoices.size
    assert_equal 0, invoices1.size
  end

  def test_find_all_by_created_at
    invoices = @invoice_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    invoices1 = @invoice_repo.find_all_by_created_at("2016-01-01")
    assert_equal 3, invoices.size
    assert_equal 0, invoices1.size
  end

  def test_find_all_by_updated_at
    invoices = @invoice_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    invoices1 = @invoice_repo.find_all_by_updated_at("2016-01-01")
    assert_equal 3, invoices.size
    assert_equal 0, invoices1.size
  end
end
