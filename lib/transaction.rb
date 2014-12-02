class Transaction
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration,
              :result, :created_at, :updated_at, :repository

  def initialize(data, repository)
    @id = data[:id].to_i
    @invoice_id = data[:invoice_id]
    @credit_card_number = data[:credit_card_number]
    @credit_card_expiration = data[:credit_card_expiration]
    @result = data[:result]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def invoice
    repository.invoice(invoice_id)
  end
end
