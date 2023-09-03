defmodule BalancedLatinSquareTest do
  use ExUnit.Case
  doctest BalancedLatinSquare

  test "bls(1)" do
    assert BalancedLatinSquare.generate_bls(1) == [[1], [1]]
  end

  test "bls(2)" do
    assert BalancedLatinSquare.generate_bls(2) == [[1, 2], [2, 1]]
  end

  test "bls(3)" do
    assert BalancedLatinSquare.generate_bls(3) ==
             [
               [1, 2, 3],
               [1, 3, 2],
               [2, 1, 3],
               [2, 3, 1],
               [3, 1, 2],
               [3, 2, 1]
             ]
  end
end
