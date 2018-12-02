defmodule AdventOfCode2018.Day02 do
  def part1(args) do
    args
    |> String.split()
    |> checksum()
  end

  defp checksum(ids) do
    counts = ids |> Enum.map(&letter_counts/1)
    counts_including(counts, 2) * counts_including(counts, 3)
  end

  defp letter_counts(id) do
    id |> String.codepoints() |> Enum.group_by(& &1) |> Enum.map(fn {_, v} -> length(v) end)
  end

  def counts_including(counts, n) do
    counts |> Enum.count(&(n in &1))
  end

  def part2(args) do
    args |> String.split() |> find_boxes() |> common_letters()
  end

  defp find_boxes([id | ids]) do
    case ids |> Enum.find(fn id2 -> length(differences(id, id2)) == 1 end) do
      nil -> find_boxes(ids)
      id2 -> {id, id2}
    end
  end

  defp differences(id1, id2) do
    String.codepoints(id1)
    |> Enum.zip(String.codepoints(id2))
    |> Enum.filter(fn {a, b} -> a != b end)
  end

  defp common_letters({id1, id2}) do
    String.codepoints(id1)
    |> Enum.zip(String.codepoints(id2))
    |> Enum.filter(fn {a, b} -> a == b end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.join()
  end
end
