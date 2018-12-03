defmodule AdventOfCode2018.Day03 do
  def part1(args) do
    ~r/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m
    |> Regex.scan(args, capture: :all_but_first)
    |> Enum.map(fn captures -> Enum.map(captures, &String.to_integer/1) end)
    |> Enum.reduce(%{}, &record_covered/2)
    |> Enum.count(fn {_, ids} -> length(ids) > 1 end)
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

  def part2(_args) do
  end
end
