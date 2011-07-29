#!/usr/bin/env ruby
# -*- ruby -*-

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutAsserts < EdgeCase::Koan

  # We shall contemplate truth by testing reality, via asserts.
  def test_assert_truth
    # CHEN Ruby has "true"
    assert true                # This should be true
  end

  # Enlightenment may be more easily achieved with appropriate
  # messages.
  def test_assert_with_message
    # CHEN Learning about "assert" from Ruby's Test::Unit
    assert true, "This should be true -- Please fix this"
  end

  # To understand reality, we must compare our expectations against
  # reality.
  def test_assert_equality
    # CHEN Basic arithmetic with integers
    expected_value = 2
    actual_value = 1 + 1

    assert expected_value == actual_value
  end

  # Some ways of asserting equality are better than others.
  def test_a_better_way_of_asserting_equality
    # CHEN Learning about "assert_equal"
    expected_value = 2
    actual_value = 1 + 1

    assert_equal expected_value, actual_value
  end

  # Sometimes we will ask you to fill in the values
  def test_fill_in_values
    assert_equal 2, 1 + 1
  end
end
