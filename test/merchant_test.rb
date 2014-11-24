require_relative '../lib/merchant'
require_relative 'test_helper'


class MerchantRespositoryTest < Minitest::Test

  def setup
    merchant_repo = MerchantRepository.new
    @merchant = merchant_repo[0]
  end

  def test_merchant_has_id
    assert @merchant.id
  end

end
