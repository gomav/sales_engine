require_relative '../lib/customer'
require_relative 'test_helper'

class CustomerRespositoryTest < Minitest::Test

  def setup
    customer_repo = CustomerRepository.new
    @customer = customer_repo[0]
  end

  def test_customer_has_id
    assert @customer.id
  end

end
