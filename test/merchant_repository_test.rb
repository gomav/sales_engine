require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
attr_reader :merchants, :merchant_repository, :sales_engine

def setup
  @merchants = [{
      id: '3',
      name: 'Willms and Sons',
      created_at: '2012-03-27 14:53:59 UTC',
      updated_at: '2012-03-27 14:53:59 UTC'
    },
    {
      id: '2',
      name: 'Klein, Rempel and Jones',
      created_at: '2012-03-27 14:53:59 UTC',
      updated_at: '2012-03-27 14:53:59 UTC'
    },
    {
      id: '7',
      name: 'Bernhard-Johns',
      created_at: '2012-03-27 14:53:59 UTC',
      updated_at: '2012-03-27 14:53:59 UTC'
    }
    ]

    @sales_engine = Minitest::Mock.new
    @merchant_repository = MerchantRepository.new(merchants, sales_engine)
  end

  def test_all
    assert_equal 3, merchant_repository.all.size
  end

  def test_random
    assert_class = Merchant, merchant_repository.random
  end

  def test_find_by_merchant_id
    merchant = merchant_repository.find_by_merchant_id(7)
    assert_equal 7, merchant.id
  end

  def test_find_by_merchant_name
    merchant = merchant_repository.find_by_merchant_name('Bernhard-Johns')
    assert_equal 'Bernhard-Johns', merchant.name
  end
end
