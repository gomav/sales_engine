require_relative '../lib/item'
require_relative 'test_helper'

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def test_item_exists
    item = Item.new
    assert item, item
  end
end
