require_relative '../lib/customer'
require_relative 'test_helper'

class CustomerTest < Minitest::Test

  def test_customer_attributes
    data = {
      id: 45,
      first_name: "bob",
      last_name: "jones",
      created_at: "2010-01-01",
      updated_at: "2014-01-01"
      }
    customer = Customer.new(data)

    assert_equal 45, customer.id
    assert_equal 'bob', customer.first_name
    assert_equal 'jones', customer.last_name
    assert_equal "2010-01-01", customer.created_at
    assert_equal "2014-01-01", customer.updated_at
  end
end
