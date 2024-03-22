defmodule Day1 do
  @moduledoc """
  Advent of Code 2023 - Day 1
  """

  def main(filepath) do
    case File.read(filepath) do
      {:ok, data} -> process_data(data)
      {:error, reason} -> IO.puts("Failed to read file: #{reason}")
    end
  end

  def process_data(data) do
    data
    |> String.split("\n", trim: true)
    |> Enum.map(&process_row/1)
    |> Enum.sum()
  end

  def process_row(row) do
    digits = row
             |> String.to_charlist
             |> fetch_first_and_last_digit

    first_element = Enum.at(digits, 0)
    last_index = length(digits) - 1
    last_element = Enum.at(digits, last_index)

    Enum.join([Integer.to_string(first_element), Integer.to_string(last_element)], "")
    |> String.to_integer
  end

  def fetch_first_and_last_digit(charlist) do
    Enum.filter(charlist, fn char ->
      char >= ?0 and char <= ?9
    end) |> Enum.map(&(&1 - ?0))
  end
end
