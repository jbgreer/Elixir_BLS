defmodule BalancedLatinSquare do
  @moduledoc """
  Given a positive integer n, generate a Balanced Latin Square for n conditions

  Take a single positive integer argument, the number of conditions (n) .
  - When n is even
     - make the first row using the formula row = 1,2,n,3,n-1,n-2,...
     - fill in the first column sequentially (mod n)
     - continue filling in the columns sequentially until the square is completed
  - When n is odd
     - follow the procedure for n even
     - append a second set of rows with the reversed contents of the even set's rows

  ## Exports
  `bls/1`: pos_integer()
  """
  require Integer

  # even_odd/2 is a private fn for alternate the value of a column position
  @spec even_odd(pos_integer, pos_integer) :: pos_integer
  defp even_odd(col, n) do
    if Integer.is_even(col) do
      n - div(col, 2)
    else
      div(col, 2) + 1
    end
  end

  @doc """
  bls/1 Generate a Balanced Latin Square as a list of lists of positive integers

  ## Parameters
      `n`: positive integer representing the number of conditions

  ## Returns
     - a non-empty list of a non-empty list of positive integers
     - raises an ArgumentError exception when agument < 1

  ## Examples
      iex> BalancedLatinSquare.bls(1)
      [[1]]
      iex> BalancedLatinSquare.bls(2)
      [[1,2], [2,1]]
      iex> BalancedLatinSquare.bls(3)
      [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
  """
  @spec bls(pos_integer()) :: nonempty_list(nonempty_list(pos_integer()))
  def bls(n) when is_integer(n) and n > 0 do
    square =
      for row <- 0..(n - 1) do
        for col <- 0..(n - 1) do
          rem(even_odd(col, n) + row, n) + 1
        end
      end

    if Integer.is_odd(n) and n > 1 do
      Enum.sort(square ++ Enum.map(square, fn row -> Enum.reverse(row) end))
    else
      Enum.sort(square)
    end
  end

  def bls(n) when n < 1 do
    raise ArgumentError, "argument must be a positive integer"
  end
end
