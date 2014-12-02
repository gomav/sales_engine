require_relative 'merchant'
require_relative 'csv_reader'

class MerchantRepository
  attr_reader :merchants, :sales_engine  # => nil

  def initialize(merchants = '', sales_engine)
    @sales_engine = sales_engine
    @merchants ||= merchants.map {|merchant| Merchant.new(merchant, self)}
  end

  def inspect
    "#<\#{self.class} \#{@data.size} rows>"
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_merchant_id(id)
    merchants.find { |merchant| merchant.id == id}
  end

  def find_by_merchant_name(name)
    merchants.find { |merchant| merchant.name == name }
  end

  def find_all_by_merchant_name(name)
    merchants.find_all { |merchant| merchant.name.downcase == name.downcase }
  end

  def find_all_by_merchant_id(id)
    merchants.find_all { |merchant| merchant.id == id}
  end

  def items(id)
    sales_engine.merchants_items(id)
  end

  def invoices(id)
    sales_engine.merchant_invoices(id)
  end
end
