defmodule Day1.Part2 do
  @moduledoc """
  Advent of Code 2023 - Day 2
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
             |> convert_words_to_numbers
             |> String.graphemes
             |> Enum.filter(fn grapheme -> grapheme >= "0" and grapheme <= "9" end)

    first_number = Enum.at(numbers, 0)
    last_index = length(numbers) - 1
    last_number = Enum.at(numbers, last_index)

    [first_number, last_number]
  end

  def convert_words_to_numbers(string) do
    number_words = %{
      "one" => "1", "two" => "2", "three" => "3",
      "four" => "4", "five" => "5", "six" => "6",
      "seven" => "7", "eight" => "8", "nine" => "9"
    }

    string
    |> String.graphemes
    |> Enum.reduce("", fn grapheme, acc ->
      result = acc <> grapheme

      Enum.reduce(number_words, result, fn {word, number}, acc ->
        String.replace(acc, word, number)
      end)
    end)
  end
end
