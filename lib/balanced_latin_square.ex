defmodule BalancedLatinSquare do
  @moduledoc """
  Given a positive integer n, generate a Balanced Latin Square for n conditions

  ## Exports
  `generate_bls/1`: takes a positive integer
  """
  require Integer

  @doc """
  even_odd/2 alternates the bls column value.

  ## Parameters
  - `column`: positive integer representing current column
  - `n`: positive integer representing the number of conditions

  ## Returns a positive integer

  ## Examples

    iex> BalancedLatinSquare.even_odd(1, 2)
    iex> BalancedLatinSquare.even_odd(1, 3)
  """
  @spec even_odd(pos_integer, pos_integer) :: pos_integer
  def even_odd(col, n) do
    if Integer.is_even(col) do
      n - div(col, 2)
    else
      div(col, 2) + 1
    end
  end

  @doc """
  bls_val/3 returns the correct bls value for a given number of conditions, row, and column

  ## Parameters
  - `row`: positive integer representing current row
  - `col`: positive integer representing current column
  - `n`: positive integer representing the number of conditions

  ## Returns a positive integer

  ## Examples
    iex>BalancedLatinSquare.bls_val(1, 2, 2)
    iex>BalancedLatinSquare.bls_val(1, 2, 3)
  """
  @spec bls_val(pos_integer, pos_integer, pos_integer) :: pos_integer
  def bls_val(row, col, n) do
    rem(even_odd(col, n) + row, n) + 1
  end

  @doc """
  bls_row/2 creates a row in the balanced Latin square with

  ## Parameters
  - `row`: positive integer representing current row
  - `n`: positive integer representing the number of conditions

  ## Returns a sequence of positive integers

  ## Examples
  """
  @spec bls_row(pos_integer, pos_integer) :: [pos_integer]
  def bls_row(row, n) do
    Enum.map(0..(n - 1), fn col -> bls_val(row, col, n) end)
  end

  @doc """
  bls_even/1 creates balanced Latin square assuming n even

  ## Parameters
  - `n`: positive integer representing the number of conditions

  ## Returns a non-empty list of a non-empty list of positive integers

  ## Examples
  """
  # @spec bls_even(pos_integer) :: nonempty_list(non_empty_list(pos_integer))
  def bls_even(n) do
    Enum.map(0..(n - 1), fn row -> bls_row(row, n) end)
  end

  @doc """
  generate_bls/1 creates balanced Latin square

  ## Parameters
  - `n`: positive integer representing the number of conditions

  ## Returns a non-empty list of a non-empty list of positive integers

  ## Examples
  """
  # @spec generate_bls(pos_integer) :: nonempty_list(non_empty_list(pos_integer))
  def generate_bls(n) when Integer.is_even(n) do
    Enum.sort(bls_even(n))
  end

  def generate_bls(n) when Integer.is_odd(n) do
    bls_e = bls_even(n)
    Enum.sort(bls_e ++ Enum.map(bls_e, fn row -> Enum.reverse(row) end))
  end
end
