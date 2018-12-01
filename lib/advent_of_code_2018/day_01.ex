defmodule AdventOfCode2018.Day01 do
  def part1(args) do
    args |> String.split() |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end

  def part2(_args) do
  end
end
