defmodule AdventOfCode2018.Day06Test do
  use ExUnit.Case

  import AdventOfCode2018.Day06

  test "part1 returns the size of the largest finite area" do
    input = """
    1, 1
    1, 6
    8, 3
    3, 4
    5, 5
    8, 9
    """

    result = part1(input)

    assert result == 17
  end

  test "grid_boundaries returns the min and max coordinates" do
    points = [
      {1, 1},
      {1, 6},
      {8, 3},
      {3, 4},
      {5, 5},
      {8, 9}
    ]

    assert %{min_x: 1, max_x: 8, min_y: 1, max_y: 9} = grid_boundaries(points)
  end

  describe "nearest_point/2" do
    test "returns the nearest point by Manhatten distance" do
      points = [{1, 1}, {1, 6}, {8, 3}]
      assert nearest_point(points, {2, 5}) == {1, 6}
    end

    test "returns :equal if there's more than one nearest point" do
      points = [{1, 1}, {1, 3}, {8, 3}]
      assert nearest_point(points, {2, 2}) == :equal
    end
  end

  test "finite_points returns points whose area doesn't reach an edge of the grid" do
    grid = %{min_x: 1, max_x: 10, min_y: 1, max_y: 10}

    map = %{
      {2, 2} => [{1, 3}],
      {5, 3} => [{5, 1}, {5, 2}],
      {3, 3} => [{2, 3}],
      {9, 5} => [{10, 5}],
      {8, 8} => [{5, 10}]
    }

    assert finite_points(map, grid) == [{3, 3}]
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
