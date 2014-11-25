require_relative '../lib/item'
require_relative 'test_helper'

class ItemTest < Minitest::Test

  def test_item_exists
    item = Item.new
    assert item, item
  end
end
