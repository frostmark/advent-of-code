defmodule Day1.Part1 do
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
    [first_number, last_number] = row |> fetch_first_and_last_number


    Enum.join([first_number, last_number], "")
    |> String.to_integer()
  end

  def fetch_first_and_last_number(string) do
    numbers = string
             |> String.graphemes
             |> Enum.filter(fn grapheme -> grapheme >= "0" and grapheme <= "9" end)

    first_number = Enum.at(numbers, 0)
    last_index = length(numbers) - 1
    last_number = Enum.at(numbers, last_index)

    [first_number, last_number]
  end
end
