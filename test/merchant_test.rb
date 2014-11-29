require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  attr_reader :merchant, :data, :parent

  def test_it_exists
  end

  def setup
    @data = {
      id: '3',
      name: 'Willms and Sons',
      created_at: '2012-03-27 14:53:59 UTC',
      updated_at: '2012-03-27 14:53:59 UTC'
    }
    @parent = Minitest::Mock.new
    @merchant = Merchant.new(data, parent)
  end

  def test_merchant_info
    assert_equal 3, merchant.id
    assert_equal 'Willms and Sons', merchant.name
    assert_equal '2012-03-27 14:53:59 UTC', merchant.created_at
    assert_equal '2012-03-27 14:53:59 UTC', merchant.updated_at
  end

end
