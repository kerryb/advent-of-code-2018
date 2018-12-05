defmodule AdventOfCode2018.Day04 do
  defmodule State do
    defstruct guard: nil, asleep_since: nil, guard_sleep_minutes: %{}
  end

  def part1(args) do
    {guard, minutes} =
      args
      |> String.trim()
      |> String.split("\n")
      |> Enum.sort()
      |> Enum.map(&String.split(&1, ~r/[[\]#: ]+/, trim: true))
      |> Enum.reduce(%State{}, &parse_line/2)
      |> Map.get(:guard_sleep_minutes)
      |> Enum.max_by(fn {guard, minutes} -> length(minutes) end)

    minute =
      minutes |> Enum.group_by(& &1) |> Map.values() |> Enum.max_by(&length/1) |> List.first()

    guard * minute
  end

  defp parse_line([_, _, _, "Guard", id, "begins", "shift"], state) do
    %{state | guard: String.to_integer(id), asleep_since: nil}
  end

  defp parse_line([_, _, minute, "falls", "asleep"], state) do
    %{state | asleep_since: String.to_integer(minute)}
  end

  defp parse_line([_, _, minute, "wakes", "up"], state) do
    %{
      state
      | asleep_since: nil,
        guard_sleep_minutes: record_sleep(state, String.to_integer(minute))
    }
  end

  defp record_sleep(state, minute) do
    state.guard_sleep_minutes
    |> Map.update(
      state.guard,
      list_minutes(state.asleep_since, minute),
      fn sleep -> sleep ++ list_minutes(state.asleep_since, minute) end
    )
  end

  defp list_minutes(start, finish) do
    start..(finish - 1) |> Enum.to_list()
  end

  def part2(_args) do
  end
end
