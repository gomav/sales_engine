require_relative 'invoice_item'

class InvoiceItemRepository

  def initialize(invoice_items)
    @invoice_items ||= invoice_items.map {|invoice_item| InvoiceItem.new(invoice_item)}
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample
  end

  def generic_find(attribute, criteria)
    @invoice_items.select { |customer| customer.send(attribute.to_sym).downcase == criteria.downcase }
  end

  def generic_non_string_find(attribute, criteria)
    @invoice_items.select { |customer| customer.send(attribute.to_sym) == criteria }
  end


  def find_by_id(criteria)
    send(:generic_non_string_find, "id", criteria)
  end

  def find_by_item_id(criteria)
    send(:generic_non_string_find, "item_id", criteria)
  end

  def find_by_invoice_id(criteria)
    send(:generic_non_string_find, "invoice_id", criteria)
  end

  def find_by_quantity(criteria)
    send(:generic_non_string_find, "quantity", criteria)
  end

  def find_by_created_at(criteria)
    send(:generic_non_string_find, "created_at", criteria)
  end

  def find_by_updated_at(criteria)
    send(:generic_non_string_find, "updated_at", criteria)
  end
end
