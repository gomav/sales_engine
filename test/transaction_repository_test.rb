require_relative 'test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :transactions, :transaction_repository, :sales_engine

def setup
  @transactions = [{

      id: 1,
      invoice_id: 1,
      credit_card_number: '4654405418249632',
      credit_card_expiration_date: '2012-03-27 14:54:09',
      result: 'fail',
      created_at: '2012-03-27 14:54:09 UTC',
      updated_at: '2012-03-27 14:54:09 UTC'
    },
    {
      id: 2,
      invoice_id: 2,
      credit_card_number: '4580251236515201',
      credit_card_expiration_date: '2012-03-27 14:54:09',
      result: 'success',
      created_at: '2012-03-27 14:54:09',
      updated_at: '2012-03-27 14:54:09 UTC'
    },
    {
      id: 3,
      invoice_id: 3,
      credit_card_number: '4354495077693036',
      credit_card_expiration_date: '2012-03-27 14:54:09',
      result: 'success',
      created_at: '2012-03-27 14:54:09 UTC',
      updated_at: '2012-03-27 14:54:09 UTC'
    }
    ]

    @sales_engine = Minitest::Mock.new
    @transaction_repository = TransactionRepository.new(transactions, sales_engine)
  end

  def test_all

    assert_equal 3, transaction_repository.all.size
  end

  def test_random

    assert_class = Transaction, transaction_repository.random
  end

  def test_find_by_transaction_id

    transaction = transaction_repository.find_by_transaction_id(1)
    assert_equal 1, transaction.id
  end

  def test_find_by_invoice_id

    transaction = transaction_repository.find_by_invoice_id(2)
    assert_equal 2, transaction.invoice_id
  end

  def test_find_by_credit_card_number

    transaction = transaction_repository.find_by_credit_card_number('4354495077693036')
    assert_equal '4354495077693036', transaction.credit_card_number
  end

  def test_find_by_credit_card_expiration
    skip
    transaction = transaction_repository.find_by_credit_card_expiration('2012-03-27 14:54:09 UTC')
    assert_equal '2012-03-27 14:54:09 UTC', transaction.credit_card_expiration
  end

  def test_find_by_result

    transaction = transaction_repository.find_by_result('success')
    assert_equal 'success', transaction.result
  end

  def test_find_all_by_transaction_id
    skip
    transaction = transaction_repository.find_all_by_transaction_id(2)
    transaction1= transaction_repository.find_all_by_transaction_id(3)
    assert_equal 2, transaction.transaction_id
    assert_equal 3, transaction.transaction_id
  end

  def test_find_all_by_invoice_id
    skip
    transaction = transaction_repository.find_all_by_invoice_id(3)
    assert_equal 1, transaction.invoice_id

  end

  def test_find_all_by_credit_card_number
    skip
    transaction = transaction_repository.find_all_by_credit_card_number('')
    transaction = transactino_repository.find_all_by_credit_card_number('4654405418249632')
    assert_equal '4354495077693036', transaction.credit_card_number
    assert_equal '4654405418249632', transaction.credit_card_number
  end

  def test_find_all_by_credit_card_expiration
    skip
    transaction = transaction.repository.find_all_by_credit_card_expiration('2012-03-27 14:54:09 UTC')
    transaction = transaction.repository.find_all_by_credit_card_expiration('')
    assert_equal '2012-03-27 14:54:09 UTC', transaction.credit_card_expiration
    assert_equal '2012-03-27 14:54:09', transaction.credit_card_expiration
  end

  def test_find_all_by_result
    skip
    transaction = transaction.repository.find_all_by_result('success')
    transaction = transaction.repository.find_all_by_result('fail')
    assert_equal 'success', transaction.result
    assert_equal 'fail', transaction.result
  end
end
