class OfficeRepository

  def initialize(data)
    @data ||= data.map {|data| Object.new()}
  end

  def all
    @data
  end

  def random
    @data.sample
  end

  def generic_find(attribute, criteria)
    @data.select { |office_obj| office_obj.send(attribute.to_sym).downcase == criteria.downcase }
  end

  def generic_non_string_find(attribute, criteria)
    @data.select { |office_obj| office_obj.send(attribute.to_sym) == criteria }
  end

  def find_by_last_name(criteria)
    send(:generic_find, "last_name", criteria)
  end

  def find_by_first_name(criteria)
    send(:generic_find, __method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_id(criteria)
    send(:generic_non_string_find, __method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_created_at(criteria)
    send(:generic_non_string_find, "created_at", criteria)
  end

  def find_by_updated_at(criteria)
    send(:generic_non_string_find, "updated_at", criteria)
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

  def find_by_customer_id(criteria)
    send(:generic_non_string_find, "customer_id", criteria)
  end

  def find_by_merchant_id(criteria)
    send(:generic_non_string_find, "merchant_id", criteria)
  end

  def find_by_status(criteria)
    send(:generic_find, "status", criteria)
  end


end
