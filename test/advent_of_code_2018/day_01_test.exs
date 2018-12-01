defmodule AdventOfCode2018.Day01Test do
  use ExUnit.Case

  import AdventOfCode2018.Day01

  test "part1 sums the inputs" do
    input = """
    +1
    +5
    -2
    """

    result = part1(input)

    assert result == 4
  end

  test "part2 finds the first repeated frequency (looping the input)" do
    input = """
    +1
    -2
    +3
    +1
    """

    result = part2(input)

    assert result == 2
  end
end
