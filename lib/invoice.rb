class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :repo

  def initialize(data, parent)
    @id = data[:id]
    @customer_id = data[:customer_id]
    @merchant_id = data[:merchant_id]
    @status = data[:status]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repo = parent
  end

  def transactions
    repo.find_transactions_from(id)
  end

  def invoice_items
    repo.find_invoice_items_from(id)
  end

  def items
    repo.find_items_from_invoice_items(id)
  end

  def customer
    repo.find_customer_from(customer_id)
  end

  def merchant
    repo.find_merchant_from(merchant_id)
  end
end
