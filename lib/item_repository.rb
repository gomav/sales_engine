require_relative 'item'        # => true
require_relative 'csv_reader'  # => true

class ItemRepository
  attr_reader :sales_engine, :items  # => nil

  def initialize(items = '', sales_engine)
    @sales_engine = sales_engine
    @items ||= items.map {|item| Item.new(item, self)}
  end

  def inspect
    "#<\#{self.class} \#{@data.size} rows>"
  end
  
  def all
    items
  end

  def random
    items.sample
  end

  def find_by_item_id(id)
    items.find { |item| item.id == id }
  end

  def find_by_item_name(name)
    items.find { |item| item.name.downcase == name.downcase }
  end

  def find_by_item_description(description)
    items.find { |item| item.description.downcase == description.downcase }
  end

  def find_by_unit_price(unit_price)
    items.find { |item| item.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    items.find { |item| item.merchant_id == merchant_id }
  end

  def load_file(path)
      contents = CsvReader.load_file(path)
      contents.map { |row| Item.new(row, self) }
  end
end
