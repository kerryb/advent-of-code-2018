defmodule AdventOfCode2018.Day03 do
  def part1(args) do
    args
    |> parse()
    |> calculate_coverage()
    |> Enum.count(fn {_, ids} -> length(ids) > 1 end)
  end

  defp parse(input) do
    ~r/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m
    |> Regex.scan(input, capture: :all_but_first)
    |> Enum.map(fn captures -> Enum.map(captures, &String.to_integer/1) end)
  end

  defp calculate_coverage(claims) do
    claims
    |> Enum.reduce(%{}, &record_covered/2)
  end

  defp record_covered([id, x_origin, y_origin, dx, dy], covered) do
    for x <- x_origin..(x_origin + dx - 1),
        y <- y_origin..(y_origin + dy - 1) do
      {x, y}
    end
    |> Enum.reduce(covered, fn coords, covered ->
      Map.update(covered, coords, [id], &[id | &1])
    end)
  end

  def part2(args) do
    claims = args |> parse()

    overlapping_ids =
      claims
      |> calculate_coverage()
      |> Map.values()
      |> Enum.filter(&(length(&1) > 1))
      |> List.flatten()
      |> MapSet.new()

    claims
    |> Enum.map(fn [id, _, _, _, _] -> id end)
    |> Enum.find(&(!MapSet.member?(overlapping_ids, &1)))
  end
end
