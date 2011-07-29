require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrays < EdgeCase::Koan
  def test_creating_arrays
    # CHEN Learning about Array class
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    # CHEN OK, Ruby has 0-based array
    array[0] = 1
    # CHEN OK, Ruby has array literal syntax []
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    # CHEN Learning about appending to array using operator <<
    # CHEN I do not like overloading of this kind for operations!
    array << 333
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    # CHEN Learning about symbols
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    # CHEN Learning Array slice[start index, number of elements]
    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    # CHEN OK to specify number of elements larger than exist
    assert_equal [:and, :jelly], array[2,20]
    # CHEN Slice starting at one past last element is OK
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    # CHEN Slice starting past end is not OK
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges
    # CHEN Learning Range, literal syntax
    assert_equal Range, (1..5).class
    # CHEN Range is not the same as Array
    assert_not_equal [1,2,3,4,5], (1..5)
    # CHEN .to_a to convert to Array
    assert_equal [1,2,3,4,5], (1..5).to_a
    # CHEN .. is inclusive but ... is exclusive range
    assert_equal [1,2,3,4], (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    # CHEN Array slicing with range just picks up each index
    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    # CHEN Learning .push for Array
    assert_equal [1,2,:last], array

    # CHEN Learning .pop for Array, returns and mutates
    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    # CHEN Learning .unshift; probably not great performance?
    assert_equal [:first,1,2], array

    # CHEN Learning .shift
    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1,2], array
  end

end
