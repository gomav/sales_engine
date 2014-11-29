require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def test_a_sales_engine_can_be_instantiated
    assert SalesEngine.new
  end

  def test_response_to_startup
    sales_engine = SalesEngine.new
    assert sales_engine.respond_to?(:startup)
  end

  def test_a_sales_engine_has_a_customer_repository
    skip
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert sales_engine.customer_repository
  end

  def test_a_sales_engine_has_an_invoice_repository
    skip
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert sales_engine.invoice_repository
  end

  def test_a_sales_engine_has_an_invoice_item_repository
    skip
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert sales_engine.invoice_item_repository
  end

  def test_a_sales_engine_has_a_item_repository
    skip
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert sales_engine.item_repository
  end

  def test_a_sales_engine_has_a_merchant_repository
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert sales_engine.merchant_repository
  end

  def test_a_sales_engine_has_a_transaction_repository
    skip
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert sales_engine.transaction_repository
  end
end
