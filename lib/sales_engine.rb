require 'csv'
require_relative 'merchant_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'


class SalesEngine
  attr_reader :parent, :customer_repository, :invoice_repository,
              :invoice_item_repository, :item_repository, :merchant_repository,
              :transaction_repository


  def initialize
    @parent = self
  end

  def startup
    startup_customer
    startup_invoice
    startup_invoice_item
    startup_item
    startup_merchant
    startup_transaction
  end

  def startup_customer
    customers = CsvReader.load_csv("customers.csv")
    # customers = CsvReader.load_csv("customers_fixture.csv")
    @customer_repository = CustomerRepository.new(customers, parent)
  end

  def startup_invoice
    invoice = CsvReader.load_csv("invoices.csv")
    # invoice = CsvReader.load_csv("invoices_fixture.csv")
    @invoice_repository = InvoiceRepository.new(invoice, parent)
  end

  def startup_invoice_item
    invoice_item = CsvReader.load_csv("invoice_items.csv")
    # invoice_item = CsvReader.load_csv("invoice_items_fixture.csv")
    @invoice_item_repository = InvoiceItemRepository.new(invoice_item, parent)
  end

  def startup_item
    item = CsvReader.load_csv("items.csv")
    # item = CsvReader.load_csv("items_fixture.csv")
    @item_repository = ItemRepository.new(item, parent)
  end

  def startup_merchant
    merchant = CsvReader.load_csv("merchants.csv")
    # merchant = CsvReader.load_csv("merchants_fixture.csv")
    @merchant_repository = MerchantRepository.new(merchant, parent)
  end

  def startup_transaction
    transaction = CsvReader.load_csv("transactions.csv")
    # transaction = CsvReader.load_csv("transactions_fixture.csv")
    @transaction_repository = TransactionRepository.new(transaction, parent)
  end

  def find_invoices_from_customer(id)
    invoice_repository.find_all_by_customer_id(id)
  end

  def find_transactions_from_customer(id)
    all_invoices = find_invoices_from_customer(id)
    all_invoice_ids = all_invoices.map(&:id)
    # all_transactions = all_invoice_ids.map do
    #|invoice_id| transaction_repository.select do |transaction|
    # transaction.invoice_id == invoice_id
    # end
    # end
    # all_invoice_ids.each do |invoice_id|
    #   all transactions << transaction_repository.select do |transaction|
    # transaction.invoice_id == invoice_id
    # end
    # end
  end

  def find_favorite_merchant_from_customer(id)
    successes = find_transactions_from_customer(id).select do |transaction|
      transaction.result == "success"
    end
    success_invoice_ids = successes.map(&:invoice_id)
    success_merchant_ids = []
    success_invoice_ids.each do |invoice_id|
      success_merchant_id << invoice_repository.merchant_id unless invoice_repository.id != invoice_id
    end
    fav_merch = success_merch_id.max_by{|id| success_merch_id.count(id) }
    merchant_repository.find_by_merchant_id(fav_merch)
  end

  def find_item_from(id)
    item_repository.find_by_item_id(id)
  end

  def find_items_from(id)
    item_repository.find_all_by_item(id)
  end

  def find_invoice_from(id)
    invoice_repository.find_by_id(id)
  end

  def find_customer_from(id)
    customer_repository.find_by_id(id)
  end

  def find_merchant_from(id)
    merchant_repository.find_by_merchant_id(id)
  end

  def find_transaction_from_invoice(id)
    # transaction_repository.find_by_invoice_id(id)
  end

  def find_invoice_items_from(item_id)
    invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_items_from_merchant(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_from_merchant(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

  def find_invoice_from_transaction(id)
    invoice_repository.find_by_id(id)
  end



end
