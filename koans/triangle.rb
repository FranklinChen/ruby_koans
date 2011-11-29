# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # Sort the lengths first.
  if a <= b
    if b <= c
      a1 = a
      a2 = b
      a3 = c
    elsif c <= a
      a1 = c
      a2 = a
      a3 = b
    else
      a1 = a
      a2 = c
      a3 = b
    end
  else
    if a <= c
      a1 = b
      a2 = a
      a3 = c
    elsif c <= b
      a1 = c
      a2 = b
      a3 = a
    else
      a1 = b
      a2 = c
      a3 = a
    end
  end

  if a1 <= 0
    raise TriangleError, 'negative or zero length'
  end

  if a1 + a2 <= a3
    raise TriangleError, 'triangle inequality'
  end

  if a1 == a3
    return :equilateral
  elsif a1 == a2 || a2 == a3
    return :isosceles
  else
    return :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
