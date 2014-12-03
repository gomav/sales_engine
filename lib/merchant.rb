class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :repository

  def initialize(data, repository)
    @id = data[:id].to_i
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def items
    repository.find_items_by_merchant(id)
  end

  def invoices
    repository.find_invoices_by_merchant(id)
  end
end
