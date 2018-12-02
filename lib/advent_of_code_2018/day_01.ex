defmodule AdventOfCode2018.Day01 do
  def part1(args) do
    args |> String.split() |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end

  def part2(args) do
    args
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Stream.cycle()
    |> Stream.scan(&(&1 + &2))
    |> Stream.scan({false, MapSet.new(), 0}, fn freq, {_, set, _} ->
      {MapSet.member?(set, freq), MapSet.put(set, freq), freq}
    end)
    |> Stream.drop_while(fn {repeated, _, _} -> !repeated end)
    |> Enum.take(1)
    |> (fn [{_, _, freq}] -> freq end).()
  end
end
