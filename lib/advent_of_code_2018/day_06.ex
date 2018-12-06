defmodule AdventOfCode2018.Day06 do
  defmodule Grid do
    defstruct min_x: 0, max_x: 0, min_y: 0, max_y: 0
  end

  def part1(args) do
    points =
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, ", "))
      |> Enum.map(fn [x, y] -> {String.to_integer(x), String.to_integer(y)} end)

    grid = grid_boundaries(points)

    map =
      for x <- grid.min_x..grid.max_x, y <- grid.min_y..grid.max_y, into: %{} do
        {{x, y}, nearest_point(points, {x, y})}
      end
      |> Enum.group_by(fn {coords, point} -> point end, fn {coords, point} -> coords end)

    finite_points = finite_points(map, grid)

    {_, points} =
      map
      |> Enum.reject(fn {point, _} -> point == :equal end)
      |> Enum.filter(fn {point, _} -> point in finite_points end)
      |> Enum.max_by(fn {_, points} -> length(points) end)

    length(points)
  end

  def grid_boundaries([{x, y} | points]) do
    points
    |> Enum.reduce(%Grid{min_x: x, max_x: x, min_y: y, max_y: y}, fn {x, y}, grid ->
      %{
        grid
        | min_x: Enum.min([x, grid.min_x]),
          max_x: Enum.max([x, grid.max_x]),
          min_y: Enum.min([y, grid.min_y]),
          max_y: Enum.max([y, grid.max_y])
      }
    end)
  end

  def nearest_point(points, {x, y}) do
    distances = points |> Enum.map(fn {x1, y1} = point -> {point, abs(x1 - x) + abs(y1 - y)} end)
    {_, min} = distances |> Enum.min_by(fn {point, distance} -> distance end)

    distances
    |> Enum.filter(fn {point, distance} -> distance == min end)
    |> case do
      [{point, _}] -> point
      _ -> :equal
    end
  end

  def finite_points(map, grid) do
    map
    |> Map.keys()
    |> Enum.reject(fn point ->
      map[point]
      |> Enum.any?(fn {x, y} ->
        x == grid.min_x || x == grid.max_x || y == grid.min_y || y == grid.max_y
      end)
    end)
  end

  def part2(_args) do
  end
end
