require 'csv'
require_relative 'merchant_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'


class SalesEngine
  attr_reader :parent, :customer_repository, :invoice_repository,
              :invoice_item_repository, :item_repository, :merchant_repository,
              :transaction_repository


  def initialize
    @parent = self
    # @item_repository = ItemRepository.new(self)
  end

  def startup
    # startup_customer
    # startup_invoice
    # startup_invoice_item
    # startup_item
    startup_merchant
    # startup_transaction
  end
  #
  # def startup_customer
  #   customers = CsvReader.load_csv("customers_fixer.rb")
  #   @customer_repository = CustomerRepository.new(customers, parent)
  # end
  #
  # def startup_invoice
  #   invoice = CsvReader.load_csv("invoices_fixer.rb")
  #   @invoice_repository = InvoiceRepository.new(invoice, parent)
  # end
  #
  # def startup_invoice_item
  #   invoice_item = CsvReader.load_csv("invoice_items_fixer.rb")
  #   @invoice_item_repository = InvoiceItemRepository.new(invoice_item, parent)
  # end
  #
  # def startup_item
  #   item = CsvReader.load_csv("items_fixer.rb")
  #   @item_repository = ItemRepository.new(item, parent)
  # end

  def startup_merchant
    merchant = CsvReader.load_csv("merchants_fixer.rb")
    @merchant_repository = MerchantRepository.new(merchant, parent)
  end

  # def startup_transaction
  #   transaction = CsvReader.load_csv("transactions_fixer.rb")
  #   @transaction_repository = TransactionRepository.new(transaction, parent)
  # end
end
