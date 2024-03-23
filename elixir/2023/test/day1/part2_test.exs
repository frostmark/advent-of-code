defmodule Day1.Part2Test do
  use ExUnit.Case
  doctest Day1.Part2

  test "greets the world" do
    assert Day1.Part2.main('data/day1/part2/test.txt') == 281
  end
end
