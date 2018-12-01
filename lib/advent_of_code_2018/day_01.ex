defmodule AdventOfCode2018.Day01 do
  def part1(args) do
    args |> String.split() |> Enum.map(&String.to_integer/1) |> Enum.sum()
  end

  def part2(args) do
    args
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Stream.cycle()
    |> first_repeating_frequency()
  end

  defp first_repeating_frequency(numbers), do: first_repeating_frequency(numbers, 0, MapSet.new())

  defp first_repeating_frequency(numbers, frequency, previous_frequencies) do
    if MapSet.member?(previous_frequencies, frequency) do
      frequency
    else
      first_repeating_frequency(
        numbers |> Stream.drop(1),
        frequency + (numbers |> Enum.take(1) |> List.first()),
        previous_frequencies |> MapSet.put(frequency)
      )
    end
  end
end
