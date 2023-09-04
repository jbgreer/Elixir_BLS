# BalancedLatinSquare

Generates a Balanced Latin Square

A Latin square[1] is an n x n array filled with n different symbols, each occuring exactly once in each row and column.

Latin squares are often used in experiment designs; each row corresponds to a participant, and each column corresponds to a condition. In order to control for the ordering of the conditions, experiments can use a Balanced Latin Square[2].

When the number of conditions is even, each condition will precede another once. When the number of conditions is odd, each condition will precede another twice.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `balanced_latin_square` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:balanced_latin_square, "~> 0.1.0"}
  ]
end
```

## Citations
[1] Wikipedia contributors. (2023, July 27). Latin square. In Wikipedia, The Free Encyclopedia. Retrieved 14:38, August 13, 2023, from https://en.wikipedia.org/w/index.php?title=Latin_square&oldid=1167384530

[2] James V Bradley. (1958). Complete Counterbalancing of Immediate Sequential Effects in a Latin Square Design. Journal of the American Statistical Association, 53:282, 525-528, DOI: 10.1080/01621459.1958.10501456

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/balanced_latin_square>.

