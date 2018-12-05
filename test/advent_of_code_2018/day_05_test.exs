defmodule AdventOfCode2018.Day05Test do
  use ExUnit.Case

  import AdventOfCode2018.Day05

  @input "dabAcCaCBAcCcaDA"
  test "part1 returns the length after reducing all reacting pairs" do
    result = part1(@input)
    assert result == 10
  end

  test "part2 returns the shortest length after removing one character" do
    result = part2(@input)
    assert result == 4
  end
end
