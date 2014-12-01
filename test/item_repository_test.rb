require_relative 'test_helper'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  attr_reader :items, :item_repository, :sales_engine

  def setup
    @items = [{
        id: 3,
        name: 'Item',
        description:  'Ea Voluptatum,Sunt officia eum qui molestiae.',
        unit_price: '32301',
        merchant_id: 1,
        created_at: '2012-03-27 14:53:59 UTC',
        updated_at: '2012-03-27 14:53:59 UTC'
      },
      {
        id: 2,
        name: 'Item',
        description: 'Autem Minima,Cumque consequuntur ad.',
        unit_price: '67076',
        merchant_id: 1,
        created_at: '2012-03-27 14:53:59 UTC',
        updated_at: '2012-03-27 14:53:59 UTC'
      },
      {
        id: 7,
        name: 'Item',
        description: 'Expedita Fuga,Fuga assumenda occaecati hic dolorem tenetur dolores nisi.',
        unit_price: '31163',
        merchant_id: 1,
        created_at: '2012-03-27 14:53:59 UTC',
        updated_at: '2012-03-27 14:53:59 UTC'
      }
      ]

      @sales_engine = Minitest::Mock.new
      @item_repository = ItemRepository.new(items, sales_engine)
    end

    def test_all
      assert_equal 3, item_repository.all.size
    end

    def test_random
      assert_class = Item, item_repository.random
    end

    def test_find_by_item_id
      item = item_repository.find_by_item_id(7)
      assert_equal 7, item.id
    end

    def test_find_by_item_name
      item = item_repository.find_by_item_name('Item')
      assert_equal 'Item', item.name
    end

    def test_find_by_item_description
      item = item_repository.find_by_item_description('Autem Minima,Cumque consequuntur ad.')
      assert_equal 'Autem Minima,Cumque consequuntur ad.', item.description
    end

    def test_find_by_unit_price

      item = item_repository.find_by_unit_price('31163')
      assert_equal '31163', item.unit_price
    end

    def test_find_by_merchant_id
       item = item_repository.find_by_merchant_id(1)
       assert_equal 1, item.merchant_id
    end
end
