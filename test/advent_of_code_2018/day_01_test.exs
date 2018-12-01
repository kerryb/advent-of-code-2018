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

  @tag :skip
  test "part2" do
    input = nil 
    result = part2(input)

    assert result
  end
end
