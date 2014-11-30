require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  attr_reader :sales_engine


  def setup
    @sales_engine = SalesEngine.new
    sales_engine.startup
  end

  def test_a_sales_engine_can_be_instantiated
    assert SalesEngine.new
  end

  def test_response_to_startup
    assert sales_engine.respond_to?(:startup)
  end

  def test_a_sales_engine_has_a_customer_repository
    sales_engine.startup
    assert sales_engine.customer_repository
  end

  def test_a_sales_engine_has_an_invoice_repository
    sales_engine.startup
    assert sales_engine.invoice_repository
  end

  def test_a_sales_engine_has_an_invoice_item_repository
    sales_engine.startup
    assert sales_engine.invoice_item_repository
  end

  def test_a_sales_engine_has_a_item_repository
    sales_engine.startup
    assert sales_engine.item_repository
  end

  def test_a_sales_engine_has_a_merchant_repository
    sales_engine.startup
    assert sales_engine.merchant_repository
  end

  def test_a_sales_engine_has_a_transaction_repository
    skip
    sales_engine.startup
    assert sales_engine.transaction_repository
  end

  def test_it_finds_invoices_from_customer_id
    assert sales_engine.respond_to?(:find_invoices_from_customer)
  end

  def test_it_finds_transactions_from_customer_id
    assert sales_engine.respond_to?(:find_transactions_from_customer)
    #sales_engine.find_transactions_from_customer("1")
  end

  def test_it_finds_favorite_merchant_from_customer_id
    # sales_engine.find_favorite_merchant_from_customer("1")
    assert sales_engine.respond_to?(:find_favorite_merchant_from_customer)
  end

  def test_it_finds_item_from_item_id
    assert sales_engine.respond_to?(:find_item_from)
  end

  def test_it_finds_invoice_from_invoice_id
    assert sales_engine.respond_to?(:find_invoice_from)
  end

  def test_it_finds_customer_from_customer_id
    assert sales_engine.respond_to?(:find_customer_from)
  end

  def test_it_finds_merchant_from_merchant_id
    assert sales_engine.respond_to?(:find_merchant_from)
  end

  def test_it_finds_transaction_from_invoice_id
    assert sales_engine.respond_to?(:find_transaction_from_invoice)
  end
end
