require_relative "office_obj"
class OfficeRepository

  def initialize(data)
    @data ||= data.map {|data| OfficeObj.new(data)}
  end

  def all
    @data
  end

  def random
    @data.sample
  end

  def generic_find(attribute, criteria)
    @data.find { |office_obj| office_obj.send(attribute.to_sym).downcase == criteria.downcase }
  end

  def generic_non_string_find(attribute, criteria)
    @data.find { |office_obj| office_obj.send(attribute.to_sym) == criteria }
  end

  def find_by_id(criteria)
    generic_non_string_find(__method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_created_at(criteria)
    send(:generic_non_string_find, __method__.to_s.split('find_by_')[1], criteria)
  end

  def find_by_updated_at(criteria)
    send(:generic_non_string_find, __method__.to_s.split('find_by_')[1], criteria)
  end

  def generic_find_all(attribute, criteria)
    @data.select { |office_obj| office_obj.send(attribute.to_sym).downcase == criteria.downcase }
  end

  def generic_non_string_find_all(attribute, criteria)
    @data.select { |office_obj| office_obj.send(attribute.to_sym) == criteria }
  end

  def find_all_by_id(criteria)
    generic_non_string_find_all(__method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_created_at(criteria)
    send(:generic_non_string_find_all, __method__.to_s.split('find_all_by_')[1], criteria)
  end

  def find_all_by_updated_at(criteria)
    send(:generic_non_string_find_all, __method__.to_s.split('find_all_by_')[1], criteria)
  end
end
