defmodule AdventOfCode2018.Day05 do
  def part1(args) do
    args
    |> String.to_charlist()
    |> reduce()
    |> length()
  end

  defp reduce(chars) do
    chars
    |> remove_reactions('')
    |> case do
      ^chars -> chars
      reduced -> reduce(reduced)
    end
  end

  defp remove_reactions([], result), do: result |> Enum.reverse()
  defp remove_reactions([h], result), do: [h | result] |> Enum.reverse()

  defp remove_reactions([h1, h2 | tail], result) do
    if abs(h1 - h2) == 32 do
      remove_reactions(tail, result)
    else
      remove_reactions([h2 | tail], [h1 | result])
    end
  end

  def part2(args) do
    ?a..?z
    |> Enum.map(&~r/#{to_string([&1])}/i)
    |> Enum.map(&Regex.replace(&1, args, ""))
    |> Enum.map(&part1/1)
    |> Enum.min()
  end
end
